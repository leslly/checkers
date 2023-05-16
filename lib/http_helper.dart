import 'package:dio/dio.dart';

class HttpHelper {
// Dio is a flutter import that here serves as support for the http package.
// Unlike http, Dio  covers most of the standard networking cases with minimal effort
// while http provides only basic functionality
  final Dio dio = Dio();
  String baseUrl = "http://api.nstack.in/v1/";

  Future<Response> post({
  required String url,
    required dynamic body,
    String? token,
}) async{
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.contentType = 'application/json';
    final response = await dio.post(
      baseUrl + url,
      data: body,
    );
    return response;
  }

  Future<Response> get({
    required String url,
    String? token,
    Map<String, dynamic>? queryParams
  }) async{
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.contentType = 'application/json';
    final response = await dio.get(
      baseUrl + url,
      queryParameters: queryParams,
    );
    print(baseUrl + url);
    return response;
  }
}

