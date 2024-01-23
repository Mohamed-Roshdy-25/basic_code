import 'package:dio/dio.dart';
import 'package:basic_code_for_any_project/app/di.dart';
import 'package:flutter/foundation.dart';
import 'package:basic_code_for_any_project/app/app_prefs.dart';
import 'package:basic_code_for_any_project/app/constants.dart';
import 'package:basic_code_for_any_project/presentation/resources/language_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static final AppPreferences _appPreferences = instance<AppPreferences>();
  static Dio? dio;

  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    if (!kReleaseMode) {
      dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
  }

  static headers() async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': language,
      'Authorization': _appPreferences.getToken(),
    };
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    headers();

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    headers();

    return dio!.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    headers();

    return dio!.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    headers();

    return dio!.delete(
      url,
      queryParameters: query,
    );
  }
}
