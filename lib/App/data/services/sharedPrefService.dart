import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref extends GetxService {
  late SharedPreferences sharedPreferences;

  /// initialize the shared pref object.
  Future<AppSharedPref> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  /// for setting true/false values in the storage.
  putBoolValue({required String key, required bool value}) {
    sharedPreferences.setBool(key, value);
  }

  /// for getting true/false values from the storage.
  bool? getBoolValue({required String key}) {
    bool? value = sharedPreferences.getBool(key);
    return value;
  }
  /// for setting string values in the storage.
  putStringValue({required String key, required String value}) async {
    bool x=await sharedPreferences.setString(key, value);
  }
  /// for getting string values from the storage.
  String? getStringValue({required String key})  {
      String? value = sharedPreferences.getString(key);
      return value;

  }
  Future<bool> removeValue({required String key}) async {
    bool? value = await sharedPreferences.remove(key);
    return value;
  }
}
