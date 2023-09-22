import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPref {
  Future<SharedPreferences> initShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<bool> setInt(int count, String key) async {
    final prefs = await initShared();
    

    return await prefs.setInt(key, count);
  }

  Future<int?> getInt({required String key}) async {
    final prefs = await initShared();

    return prefs.getInt(key) ?? 0;
  }


}
