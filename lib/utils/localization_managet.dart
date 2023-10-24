import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationManager {
  static final LocalizationManager _instance = LocalizationManager._internal();
  factory LocalizationManager() => _instance;
  LocalizationManager._internal();

  Future<void> saveLocalization(int lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(ManagerKeyStorage.language, lang);
  }

  Future<int> getLocalization() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getInt(ManagerKeyStorage.language);
    return result ?? 0;
  }
}
