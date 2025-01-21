import 'dart:developer';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.escuelajs.co/api/v1',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        log('--- REQUEST START ---', name: 'DioClient');
        log('Method: ${options.method}', name: 'DioClient');
        log('Path: ${options.uri}', name: 'DioClient');
        log('Headers: ${options.headers}', name: 'DioClient');
        if (options.queryParameters.isNotEmpty) {
          log('Query Params: ${options.queryParameters}', name: 'DioClient');
        }
        if (options.data != null) {
          log('Body: ${options.data}', name: 'DioClient');
        }
        log('--- REQUEST END ---', name: 'DioClient');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log('--- RESPONSE START ---', name: 'DioClient');
        log('Status Code: ${response.statusCode}', name: 'DioClient');
        log('Data: ${response.data}', name: 'DioClient');
        log('--- RESPONSE END ---', name: 'DioClient');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        log('--- ERROR START ---', name: 'DioClient');
        log('Status Code: ${e.response?.statusCode}', name: 'DioClient');
        log('Message: ${e.message}', name: 'DioClient');
        if (e.response?.data != null) {
          log('Error Data: ${e.response?.data}', name: 'DioClient');
        }
        log('--- ERROR END ---', name: 'DioClient');
        return handler.next(e);
      },
    ));
  }

  Dio get dio => _dio;
}
