package com.neil.master_scanner_app


import BridgeChanel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,BridgeChanel.chanel).setMethodCallHandler { call, result ->
            BridgeChanel().call(this,call,result)
        }
    }


}
