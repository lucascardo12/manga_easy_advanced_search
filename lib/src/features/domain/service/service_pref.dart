import 'package:manga_easy_advanced_search/src/features/domain/entities/key_pref_enum.dart';

abstract class ServicePrefs {
  Future<void> savePref(KeyPrefsEnum key, bool value);
  Future<bool> readPref(KeyPrefsEnum key);
}
