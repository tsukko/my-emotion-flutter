//import 'package:firebase_admob/firebase_admob.dart';
//
//MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//  keywords: <String>['flutterio', 'beautiful apps'],
//  contentUrl: 'https://flutter.io',
//  birthday: DateTime.now(),
//  childDirected: false,
//  designedForFamilies: false,
//  gender: MobileAdGender.male,
//  // or MobileAdGender.female, MobileAdGender.unknown
//  testDevices: <String>[], // Android emulators are considered test devices
//);
//
//BannerAd myBanner = BannerAd(
//  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//  // https://developers.google.com/admob/android/test-ads
//  // https://developers.google.com/admob/ios/test-ads
//  adUnitId: BannerAd.testAdUnitId,
//  size: AdSize.smartBanner,
//  targetingInfo: targetingInfo,
//  listener: (MobileAdEvent event) {
//    // 広告の読み込みが完了
//    print("BannerAd event is $event");
//  },
//);
