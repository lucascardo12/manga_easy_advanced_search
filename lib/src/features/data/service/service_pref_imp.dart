import 'package:manga_easy_advanced_search/src/features/domain/entities/key_pref_enum.dart';
import 'package:manga_easy_advanced_search/src/features/domain/service/service_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicePrefsImp implements ServicePrefs {
  @override
  Future<void> savePref(KeyPrefsEnum key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key.name, value);
  }

  @override
  Future<bool> readPref(KeyPrefsEnum key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key.name) ?? false;
  }
}
