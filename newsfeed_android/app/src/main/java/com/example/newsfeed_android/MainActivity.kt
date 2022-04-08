package com.example.newsfeed_android
import android.os.Bundle
import android.view.Window
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.newsfeed_android.databinding.ActivityMainBinding
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import kotlinx.coroutines.*

private const val FLUTTER_ENGINE_NAME = "nps_flutter_engine_name"
private const val ROW_ITEM_NAME = "row_item"

class MainActivity : AppCompatActivity() {
    private var recyclerViewAdapter: RecyclerViewAdapter? = null
    private var rowsArrayList: ArrayList<String> = ArrayList()
    private var isLoading = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        warmupFlutterEngine()

        this.supportRequestWindowFeature(Window.FEATURE_NO_TITLE)
        val binding = ActivityMainBinding.inflate(layoutInflater)

        populateData(rowsArrayList)

        initAdapter(binding)
        initScrollListener(binding)
        setContentView(binding.root)
    }

    private fun initScrollListener(binding: ActivityMainBinding) {
        val loadMoreCallback = LoadMoreOnScrollListener(callback = {
            val linearLayoutManager = binding.recyclerView.layoutManager as LinearLayoutManager?
            if (!isLoading) {
                if (linearLayoutManager != null &&
                    linearLayoutManager.findLastCompletelyVisibleItemPosition() == (rowsArrayList.size - 1)) {
                    isLoading = true
                    loadMore()
                }
            }
        })
        binding.recyclerView.addOnScrollListener(loadMoreCallback)
    }

    private fun initAdapter( binding: ActivityMainBinding) {
        recyclerViewAdapter = RecyclerViewAdapter(rowsArrayList)
        binding.recyclerView.layoutManager = LinearLayoutManager(applicationContext)
        binding.recyclerView.adapter = recyclerViewAdapter
    }

    private fun populateData(list: ArrayList<String> ) {
        for (i in 0..20) {
            list.add(ROW_ITEM_NAME)
        }
    }

    private fun loadMore() {
        if(rowsArrayList.size in 19..29){
            runFlutterNPS()
        }
        runBlocking {
            launch {
                fakeRequest()
                rowsArrayList.removeAt(rowsArrayList.size - 1)
                val scrollPosition = rowsArrayList.size
                recyclerViewAdapter?.notifyItemRemoved(scrollPosition)

                var currentSize = rowsArrayList.size
                val nextLimit = currentSize + 10
                while (currentSize - 1 < nextLimit) {
                    rowsArrayList.add(ROW_ITEM_NAME)
                    currentSize++
                }
                isLoading = false
                recyclerViewAdapter?.notifyItemRangeInserted(nextLimit - 10,10)
            }
        }
    }



    private suspend fun fakeRequest(): Boolean {
        delay(2000)
        return true
    }

    private fun runFlutterNPS() {
        startActivity(
            FlutterActivity.withCachedEngine(FLUTTER_ENGINE_NAME)
                .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                .build(this)
        )
    }

    private fun warmupFlutterEngine() {
        val flutterEngine = FlutterEngine(this)

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
            .getInstance()
            .put(FLUTTER_ENGINE_NAME, flutterEngine)
    }

    internal class LoadMoreOnScrollListener(private var callback: () -> Unit) : RecyclerView.OnScrollListener() {
        override fun onScrolled(recyclerView: RecyclerView, dx: Int, dy: Int) {
            super.onScrolled(recyclerView, dx, dy)
            callback()
        }
    }
}
