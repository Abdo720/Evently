import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late final SharedPreferences prefs;

  static void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Savebool1(bool flag) {
    return prefs.setBool("Intro", flag);
  }

  static Savebool2(bool flag) {
    return prefs.setBool("sign_in", flag);
  }

  static Getbool1(String key) {
    return prefs.getBool(key);
  }

  static Getbool2(String key) {
    return prefs.getBool(key);
  }

  static Savebool3(bool flag) {
    return prefs.setBool("google", flag);
  }

  static Getbool3(String key) {
    return prefs.getBool(key);
  }
}
