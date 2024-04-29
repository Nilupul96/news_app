import 'package:shared_preferences/shared_preferences.dart';
import 'app_logger.dart';

class LocalStorage {
  static final LocalStorage _singleton = LocalStorage._internal();

  factory LocalStorage() {
    return _singleton;
  }

  LocalStorage._internal();

  static String get IS_SHOW_ONBOARDING => 'com.news4u.app.isShowOnboarding';
  static String get COUNTRY_CODE => 'com.news4u.app.countryCode';

  Future<bool?> getShowOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(IS_SHOW_ONBOARDING);
  }

  Future<void> setShowOnboarding(bool isShow) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(IS_SHOW_ONBOARDING, isShow);
    Log.info("$isShow save in local");
  }

  Future<String?> getCountryCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(COUNTRY_CODE);
  }

  Future<void> setCountryCode(String countryCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(COUNTRY_CODE, countryCode);
    Log.info("$countryCode save in local");
  }
}
