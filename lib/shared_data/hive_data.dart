import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  Future initHive() async {
    await Hive.initFlutter();
    await Hive.openBox("testBox");
  }

  Future<Box> openBox({String boxName = "testBox"}) async {
    var box = Hive.box(boxName);
    return box;
  }

  setInt(int value, {String key = "counter"}) async {
    var box = await openBox();
    box.put(key, value);
  }

  Future<int> getInt({String key = "counter"}) async {
    var box = await openBox();

    return box.get(key) ?? 0;
  }
}
