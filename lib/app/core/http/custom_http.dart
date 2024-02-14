import 'package:dio/dio.dart';

import 'http_interceptor.dart';

abstract class CustomHttp<T> {
  Future<T> get(String url, {Map<String, String>? headers});
  Future<T> post(String url, {Map<String, String>? headers, dynamic body});
  Future<T> put(String url, {Map<String, String>? headers, dynamic body});
  Future<T> delete(String url, {Map<String, String>? headers});
}

class CustomHttpImpl implements CustomHttp {
  late final Dio dio;

  CustomHttpImpl() {
    dio = Dio();
    dio.options.baseUrl = 'http://127.0.0.1:3000';
    dio.interceptors.add(HttpInterceptor());
  }

  @override
  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    return await dio.get(url, options: Options(headers: headers));
  }

  @override
  Future<dynamic> post(String url, {Map<String, String>? headers, dynamic body}) async {
    return await dio.post(url, data: body, options: Options(headers: headers));
  }

  @override
  Future<dynamic> put(String url, {Map<String, String>? headers, dynamic body}) async {
    return await dio.put(url, data: body, options: Options(headers: headers));
  }

  @override
  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    return await dio.delete(url, options: Options(headers: headers));
  }
}
