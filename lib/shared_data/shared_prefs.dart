import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPref {
  Future<SharedPreferences> initShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<bool> setInt(int count, {String key = "counter"}) async {
    final prefs = await initShared();

    return await prefs.setInt(key, count);
  }

  Future<int?> getInt({required String key}) async {
    final prefs = await initShared();

    return prefs.getInt(key) ?? 0;
  }

// await prefs.setBool('repeat', true);
// // Save an double value to 'decimal' key.
// await prefs.setDouble('decimal', 1.5);
// // Save an String value to 'action' key.
// await prefs.setString('action', 'Start');
// // Save an list of strings to 'items' key.
// await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
}
