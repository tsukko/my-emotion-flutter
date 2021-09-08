import 'dart:async';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// shared_preferencesで最終アクセス日時を保存するためのクラス
class SharedPreferencesUtil {
  Future<String> lastDate() async {
    await initializeDateFormatting('ja_JP');
    final formatter = DateFormat('yyyy/MM/dd(E) HH:mm', 'ja_JP');
    final pref = await SharedPreferences.getInstance();
    final data = pref.getInt('last_data');
    var lastDate = '更新日時なし';
    if (data != null) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(data);
      final formatted = formatter.format(dateTime);
      lastDate = formatted;
    }
    return lastDate;
  }

  Future<String> updateDate() async {
    await initializeDateFormatting('ja_JP');
    final formatter = DateFormat('yyyy/MM/dd(E) HH:mm', 'ja_JP');
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final pref = await SharedPreferences.getInstance();
    await pref.setInt('last_data', timestamp);
    final dateTimeNow = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final formattedNow = formatter.format(dateTimeNow);

    return formattedNow;
  }

  Future<void> saveDefaultUserName(String userName) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('twitter_user_name', userName);
  }

  Future<String> getDefaultUserName() async {
    final pref = await SharedPreferences.getInstance();
    var userName = pref.getString('twitter_user_name');
    if (userName == null) {
      userName = "";
    }
    return userName;
  }
}
