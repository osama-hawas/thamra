import 'package:dio/dio.dart';

class DioHelper {
  static final _dio =
      Dio(BaseOptions(baseUrl: 'https://thimar.amr.aait-d.com/api/'));

  static Future<CustomResponse> post(String endPoint,
      {Map<String, dynamic>? data}) async {
    // print(data);

    try {
      final response = await _dio.post(endPoint, data: data);
      print(response.data);
      return CustomResponse(
          message: response.data["status"],
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
}

class CustomResponse {
  final Response? response;
  final String message;
  final bool isSuccess;

  CustomResponse(
      {this.response, required this.message, required this.isSuccess});
}
