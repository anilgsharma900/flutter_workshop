import 'package:shared_preferences/shared_preferences.dart';

/// Created by Anil Sharma on 13/02/23.
class AppStore {
  static final AppStore getInstance = AppStore._();
  static late SharedPreferences prefs;

  AppStore._(){
    _prefsInstance();
  }

  static void _prefsInstance() async {
    prefs = await SharedPreferences.getInstance();
  }


  static void setAuthentication(bool isAuth) {
    if (isAuth) {
      prefs.setBool("auth", isAuth);
    }
  }

  static bool? getAuth() {
    return prefs.getBool("auth");
  }


}
