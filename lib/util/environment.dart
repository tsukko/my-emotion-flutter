// デバッグビルドの場合、タイトルに(deb)を付ける
import 'package:googleapis/language/v1.dart';

import 'environment_protection.dart';

// 環境変数
String envTitle(String title) {
  return bool.fromEnvironment('dart.vm.product') ? title : title + ' (deb)';
}

String adUnitId() {
  return adUnitId_p();
}

// twitter api
final String consumerKey = consumerKey_p;
final String consumerSecret = consumerSecret_p;
final String token = token_p;
final String tokenSecret = tokenSecret_p;

// Google Cloud Natural Language in my Flutter
final credentials = credentials_p;
var scopes = [CloudNaturalLanguageApi.cloudLanguageScope];
var emojiArray = [
  "🤪",
  "🤮",
  "😵",
  "😫",
  "😖",
  "😔",
  "☹️",
  "😟",
  "😕",
  "😐",
  "😶", // 0
  "🙂",
  "🙃",
  "😀",
  "😃",
  "😄",
  "😆",
  "😝",
  "😤",
  "🤩",
  "🥳",
];
