import 'package:dio/dio.dart';
import 'package:thamra/core/data/local/cache_helper.dart';

class DioHelper {
  final _dio =
      Dio(BaseOptions(baseUrl: 'https://thimar.amr.aait-d.com/api/', headers: {
    "Accept": "application/json",
    "Authorization": "Bearer ${CacheHelper.getUserToken()}",
  }));
Map<String,dynamic>get headers=>  {
  "Authorization": "Bearer ${CacheHelper.getUserToken()}",
  "Accept": "application/json"
};
  Future<CustomResponse> get(String endPoint,
      {Map<String, dynamic>? data}) async {
    print(data);

    try {
      final response = await _dio.get(
        endPoint,
        data: data,
        options: Options(
          headers: headers
        ),
      );
      print(response.data);
      return CustomResponse(
          message: response.data["message"],
          isSuccess: true,
          response: response);
    } on DioError catch (ex) {
      print(ex.response?.data);
      return CustomResponse(
        message: ex.response?.data is! List
            ? ex.response?.data["message"] ?? "failed"
            : "failed",
        isSuccess: false,
      );
    }
  }

  Future<CustomResponse> post(String endPoint,
      {Map<String, dynamic>? data}) async {
    print(data);

    try {
      final response = await _dio.post(
        endPoint,
        data: FormData.fromMap(data ?? {}),
        options: Options(
          headers: {
            "Authorization": "Bearer ${CacheHelper.getUserToken()}",
            "Accept": "application/json"
          },
        ),
      );
      print(response.data);
      return CustomResponse(
          message: response.data["message"],
          isSuccess: true,
          response: response);
    } on DioError catch (ex) {
      print(ex.response?.data);
      return CustomResponse(
        message: ex.response?.data["message"] ?? "failed",
        isSuccess: false,
      );
    }
  }
  Future<CustomResponse> delete(String endPoint,
      {Map<String, dynamic>? data}) async {
    print(data);

    try {
      final response = await _dio.delete(
        endPoint,
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer ${CacheHelper.getUserToken()}",
            "Accept": "application/json"
          },
        ),
      );
      print(response.data);
      return CustomResponse(
          message: response.data["message"],
          isSuccess: true,
          response: response);
    } on DioError catch (ex) {
      print(ex.response?.data);
      return CustomResponse(
        message: ex.response?.data is! List
            ? ex.response?.data["message"] ?? "failed"
            : "failed",
        isSuccess: false,
      );
    }
  }
}

class CustomResponse {
  final Response? response;
  final String message;
  final bool isSuccess;

  CustomResponse(
      {this.response, required this.message, required this.isSuccess});
}

