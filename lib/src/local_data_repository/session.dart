
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  void setString(String key, String value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  Future<String> getString(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = sharedPreferences.getString(key) ?? "";
    return res;
  }

  void setSignIn(bool value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isSignIn", value);
  }

  Future<bool> getSignIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("isSignIn") ?? false;
  }
}