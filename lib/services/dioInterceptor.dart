// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");

    options.headers['Authorization'] = 'Bearer $token';

    options.headers['Content-Type'] = 'application/json';

    super.onRequest(options, handler);
  }
}
