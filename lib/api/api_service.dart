import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:training/api/constant.dart';
import 'package:training/modul/pretty_face.dart';

enum DioMethod { post, get, put, delete }

class APIService {
  APIService._singleton();
  static final APIService instance = APIService._singleton();
  String get baseUrl {
    if (kDebugMode) {
      return 'test url';
    }
    return 'production-url';
  }

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    String? contentType,
    formData,
  }) async {
    final dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      contentType: contentType ?? Headers.formUrlEncodedContentType,
    ));

    switch (method) {
      case DioMethod.post:
        return dio.post(
          endpoint,
          data: param ?? formData,
        );
      case DioMethod.get:
        return dio.get(
          endpoint,
          queryParameters: param,
        );
      case DioMethod.put:
        return dio.put(
          endpoint,
          data: param ?? formData,
        );
      case DioMethod.delete:
        return dio.delete(
          endpoint,
          data: param ?? formData,
        );
      default:
        return dio.post(
          endpoint,
          data: param ?? formData,
        );
    }
  }
}
