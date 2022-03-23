package com.example.newsfeed_android
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.Window
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

private const val FLUTTER_ENGINE_NAME = "nps_flutter_engine_name"
private const val ROW_ITEM_NAME = "row_item"

class MainActivity : AppCompatActivity() {
    private lateinit var recyclerView: RecyclerView
    private lateinit var recyclerViewAdapter: RecyclerViewAdapter
    var rowsArrayList: ArrayList<String> = ArrayList()
    var isLoading = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        this.supportRequestWindowFeature(Window.FEATURE_NO_TITLE)
        setContentView(R.layout.activity_main)
        recyclerView = findViewById(R.id.recyclerView)

        warmupFlutterEngine()
        populateData(rowsArrayList)
        initAdapter()
        initScrollListener()
    }

    private fun initScrollListener() {
        recyclerView.addOnScrollListener(object : RecyclerView.OnScrollListener() {
            override fun onScrolled(recyclerView: RecyclerView, dx: Int, dy: Int) {
                super.onScrolled(recyclerView, dx, dy)
                val linearLayoutManager = recyclerView.layoutManager as LinearLayoutManager?
                if (!isLoading) {
                    if (linearLayoutManager != null &&
                        linearLayoutManager.findLastCompletelyVisibleItemPosition() == (rowsArrayList.size - 1)) {
                        isLoading = true
                        loadMore()
                    }
                }
            }
        })
    }

    private fun initAdapter() {
        recyclerViewAdapter = RecyclerViewAdapter(rowsArrayList)
        recyclerView.layoutManager = LinearLayoutManager(applicationContext)
        recyclerView.adapter = recyclerViewAdapter
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

        val handler = Handler(Looper.myLooper()!!)
        handler.postDelayed({
            rowsArrayList.removeAt(rowsArrayList.size - 1)
            val scrollPosition = rowsArrayList.size
            recyclerViewAdapter.notifyItemRemoved(scrollPosition)

            var currentSize = rowsArrayList.size
            val nextLimit = currentSize + 10
            while (currentSize - 1 < nextLimit) {
                rowsArrayList.add(ROW_ITEM_NAME)
                currentSize++
            }
            isLoading = false
            recyclerViewAdapter.notifyItemRangeInserted(nextLimit - 10,10)
        }, 2000)
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
}
