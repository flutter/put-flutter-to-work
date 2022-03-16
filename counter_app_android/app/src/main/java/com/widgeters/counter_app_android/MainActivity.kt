package com.widgeters.counter_app_android;

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.View
import android.view.Window
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class MainActivity : AppCompatActivity() {
    lateinit var recyclerView: RecyclerView
    lateinit var recyclerViewAdapter: RecyclerViewAdapter
    var rowsArrayList: ArrayList<String> = ArrayList()
    var isLoading = false
    var name = "newsfeed";

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        this.supportRequestWindowFeature(Window.FEATURE_NO_TITLE)
        setContentView(R.layout.activity_main)
        recyclerView = findViewById(R.id.recyclerView)

        warmupFlutterEngine()
        initializeStatics()
        populateData()
        initAdapter()
        initScrollListener()
    }

    private fun initScrollListener() {
        recyclerView.addOnScrollListener(object : RecyclerView.OnScrollListener() {
            override fun onScrolled(recyclerView: RecyclerView, dx: Int, dy: Int) {
                super.onScrolled(recyclerView, dx, dy)
                val linearLayoutManager = recyclerView.layoutManager as LinearLayoutManager?
                if (!isLoading) {
                    if (linearLayoutManager != null && linearLayoutManager.findLastCompletelyVisibleItemPosition() == (rowsArrayList.size - 1)) {
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

    private fun initializeStatics() {
        val appName: TextView = findViewById(R.id.appName)
        val dot: ImageView = findViewById(R.id.blueDot)
        appName.text = name
        dot.setImageResource(R.drawable.dot)
    }

    private fun populateData() {
        for (i in 0..20) {
            rowsArrayList.add("Item")
        }
    }

    private fun loadMore() {
        if(rowsArrayList.size in 11..29){
            runFlutterNPS()
        }

        val handler = Handler(Looper.myLooper()!!)
        handler.postDelayed(Runnable {
            rowsArrayList.removeAt(rowsArrayList.size - 1)
            val scrollPosition = rowsArrayList.size
            recyclerViewAdapter.notifyItemRemoved(scrollPosition)

            var currentSize = rowsArrayList.size
            val nextLimit = currentSize + 10
            while (currentSize - 1 < nextLimit) {
                rowsArrayList.add("Item")
                currentSize++
            }
            recyclerViewAdapter.notifyDataSetChanged()
            isLoading = false
        }, 2000)
    }

    private fun runFlutterNPS() {
        startActivity(
            FlutterActivity.withCachedEngine("my_engine_id")
                .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                .build(this)
        );
    }
    private fun warmupFlutterEngine() {
        val flutterEngine = FlutterEngine(this);

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        );

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
            .getInstance()
            .put("my_engine_id", flutterEngine);
    }
}

//
//import android.content.Intent
//import io.flutter.embedding.android.FlutterActivity;
//import androidx.appcompat.app.AppCompatActivity
//import android.os.Bundle
//import android.widget.Button
//import android.widget.TextView
//import com.example.counter_app_android.R
//import com.google.android.material.floatingactionbutton.FloatingActionButton
//import io.flutter.embedding.android.FlutterActivityLaunchConfigs
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.embedding.engine.FlutterEngineCache
//import io.flutter.embedding.engine.dart.DartExecutor
//
//class MainActivity : AppCompatActivity() {
//    private var count : Int = 0
//    override fun onCreate(savedInstanceState: Bundle?) {
//
//        super.onCreate(savedInstanceState)
//        setContentView(R.layout.activity_main)
//
//        val buttonIncrementCount = findViewById<FloatingActionButton>(R.id.floatingActionButton)
//        val countText = findViewById<TextView>(R.id.countText)
//
//        // Instantiate a FlutterEngine.
//        val flutterEngine = FlutterEngine(this);
//
//        // Start executing Dart code to pre-warm the FlutterEngine.
//        flutterEngine.dartExecutor.executeDartEntrypoint(
//            DartExecutor.DartEntrypoint.createDefault()
//        );
//
//        // Cache the FlutterEngine to be used by FlutterActivity.
//        FlutterEngineCache
//            .getInstance()
//            .put("my_engine_id", flutterEngine);
//
//        buttonIncrementCount.setOnClickListener {
//            countText.text = (++count).toString()
//            if (count%5 == 0) {
//                startActivity(
//                    FlutterActivity
//                    .withCachedEngine("my_engine_id")
//                    .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
//                    .build(this)
//                );
//            }
//        }
//    }
//}