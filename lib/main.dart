import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:splashscreen/splashscreen.dart';

import 'util/view_const.dart';
import 'views/top.dart';
import 'views/tweet_emotion_view.dart';
import 'views/twitter_login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // TODO あとで対応
//      home: _MyApp(),
      home: Top(),
      routes: <String, WidgetBuilder>{
        '/top': (context) => Top(),
        '/tweet': (context) => TwitterLoginView(),
        '/twitter_api': (context) => TweetEmotionView(),
      },
    );
  }
}

class _MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: Top(),
        title: Text(
          'Welcome In SplashScreen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
//        image: FlutterLogo(),
        backgroundColor: ViewConst.splashBackgroundColor,
        styleTextUnderTheLoader: const TextStyle(),
        photoSize: 100,
        onClick: () => print('Flutter Egypt'),
        loaderColor: ViewConst.splashLoaderColor);
  }
}
