import 'package:shared_preferences/shared_preferences.dart';

class PreferenceGlobal {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setProfileImage(String url) async =>
      await _preferences.setString('img', url);

  static SharedPreferences getPref() {
    return _preferences;
  }
}
