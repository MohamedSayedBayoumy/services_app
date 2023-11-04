import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../common/errors/remote_errors.dart';

abstract class GetLocalHomeData {
  Future<Either<HandleErrors, List>> localCategories();
}

class FetchLocalHomeData implements GetLocalHomeData {
  @override
  Future<Either<HandleErrors, List>> localCategories() async {
    try {
      var box = await Hive.openBox('CacheHomeData');

      return Right(
        box.get("CacheHomeData"),
      );
    } catch (e) {
      return left(
        HandleLocalErrors.fromTypeError(
          e.toString(),
        ),
      );
    }
  }
}
