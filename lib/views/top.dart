import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

import '../util/environment.dart';
import '../util/shared_preferences_util.dart';
import '../widget/menu.dart';

class Top extends StatefulWidget {
  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  String nowStr;
  String loadStr;

  Future<void> _readData() async {
    loadStr = await SharedPreferencesUtil().lastDate();
    nowStr = await SharedPreferencesUtil().updateDate();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 見やすさのため、一時的に背景色をつける。
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text(envTitle('Top Screen')),
      ),
      drawer: Menu().build(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _header(),
          Column(
            children: <Widget>[
              _mainBody(),
              _mainDummyBody(),
            ],
          ),
          _footer(),
        ],
      ),
    );
  }

  Widget _header() {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _nowDate(),
          _lastDate(),
        ],
      ),
      //pendingWidget('top area.', 120.0),
    );
  }

  Widget _nowDate() {
    return Container(
      child: Text('アクセス日時：$nowStr', style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _lastDate() {
    return Container(
//      margin: EdgeInsets.all(2.0),
      child: Text('最終更新日時：$loadStr', style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _footer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: _adMobBanner(),
    );
  }

  Widget _mainBody() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _scan(),
          ),
          Expanded(
            flex: 1,
            child: _search(),
          ),
        ],
      ),
    );
  }

  Widget _scan() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/tweet');
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8),
              child: Icon(
                Icons.photo_camera,
                size: 42,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child:
                  const Text('twitter login', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/twitter_api');
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8),
              child: Icon(
                Icons.find_in_page,
                size: 42,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: const Text('twitter api', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainDummyBody() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _dummyCard(),
          ),
          Expanded(
            flex: 1,
            child: _dummyCard(),
          ),
        ],
      ),
    );
  }

  Widget _dummyCard() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/top');
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8),
              child: Icon(
                Icons.device_unknown,
                size: 42,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: const Text('ダミー', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _adMobBanner() {
    return NativeAdmobBannerView(
      adUnitID: adUnitId(),

      // Styling native view with options
      options: const BannerOptions(
        backgroundColor: Colors.white,
        indicatorColor: Colors.black,
        ratingColor: Colors.yellow,
        adLabelOptions: const TextOptions(
          fontSize: 12,
          color: Colors.white,
          backgroundColor: Color(0xFFFFCC66),
        ),
        headlineTextOptions: const TextOptions(
          fontSize: 16,
          color: Colors.black,
        ),
        advertiserTextOptions: const TextOptions(
          fontSize: 14,
          color: Colors.black,
        ),
        bodyTextOptions: const TextOptions(
          fontSize: 12,
          color: Colors.grey,
        ),
        storeTextOptions: const TextOptions(
          fontSize: 12,
          color: Colors.black,
        ),
        priceTextOptions: const TextOptions(
          fontSize: 12,
          color: Colors.black,
        ),
        callToActionOptions: const TextOptions(
          fontSize: 15,
          color: Colors.white,
          backgroundColor: Color(0xFF4CBE99),
        ),
      ),

      // Whether to show media or not
      showMedia: false,

      // Content paddings
      contentPadding: EdgeInsets.all(10),

      onCreate: (controller) {
        // controller.setOptions(BannerOptions()); // change view styling options
      },
    );
  }
}
