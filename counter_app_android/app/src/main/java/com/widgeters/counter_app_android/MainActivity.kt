package com.example.counter_app_android

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity;
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import com.google.android.material.floatingactionbutton.FloatingActionButton
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class MainActivity : AppCompatActivity() {
    private var count : Int = 0
    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val buttonIncrementCount = findViewById<FloatingActionButton>(R.id.floatingActionButton)
        val countText = findViewById<TextView>(R.id.countText)

        // Instantiate a FlutterEngine.
        val flutterEngine = FlutterEngine(this);

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        );

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
            .getInstance()
            .put("my_engine_id", flutterEngine);

        buttonIncrementCount.setOnClickListener {
            countText.text = (++count).toString()
            if (count%5 == 0) {
                startActivity(
                    FlutterActivity
                    .withCachedEngine("my_engine_id")
                    .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                    .build(this)
                );
            }
        }
    }
}