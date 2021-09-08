package jp.co.integrityworks.myemotion

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        print("debbbbb:configureFlutterEngine:" + BuildConfig.admob_app_id);
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
