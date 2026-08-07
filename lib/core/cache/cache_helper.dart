import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._();

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveBool({
    required String key,
    required bool value,
  }) async {
    return await _prefs.setBool(key, value);
  }

  static bool getBool({required String key}) {
    return _prefs.getBool(key) ?? false;
  }

  static Future<bool> remove({required String key}) async {
    return await _prefs.remove(key);
  }

  static Future<bool> clear() async {
    return await _prefs.clear();
  }
}
