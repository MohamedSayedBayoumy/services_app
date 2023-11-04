import 'package:hive/hive.dart';

abstract class GetLocalHomeData {
  Future<List> localCategories();
}

class FetchLocalHomeData implements GetLocalHomeData {
  @override
  Future<List> localCategories() async {
    var box = await Hive.openBox('CacheHomeData');

    return box.get("CacheHomeData");
  }
}
