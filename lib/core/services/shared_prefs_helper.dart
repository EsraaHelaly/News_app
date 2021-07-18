import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrfsHelper {
  static SharedPreferences sharedprefs;

  static init() async {
    sharedprefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {@required String key, @required bool value}) async {
    return await sharedprefs.setBool(key, value);
  }

  static bool getData({@required String key}) {
    return sharedprefs.getBool(key);
  }
}
