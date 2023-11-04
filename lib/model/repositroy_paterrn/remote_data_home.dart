import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/category_models.dart';
import '../../common/errors/remote_errors.dart';

abstract class GetRemoteHomeData {
  Future<Either<RemoteErrors, List<CategoryModel>>> getCategories();
}

class FetchRemoteHomeData implements GetRemoteHomeData {
  @override
  Future<Either<RemoteErrors, List<CategoryModel>>> getCategories() async {
    try {
      final response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");

      final box = await Hive.openBox('CacheHomeData');
      await box.put('CacheHomeData',
          response.data.getRange(0, 3).toList() as List<dynamic>);

      return Right(
        List<CategoryModel>.from(
            response.data.map((e) => CategoryModel.fromJson(e))),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print("TYPE : ${e.type}");
      }
      return left(HandlerRemoteErrors.fromDioExceptionType(e.type));
    }
  }
}
