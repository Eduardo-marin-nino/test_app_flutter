import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_app_flutter/core/paths/local_paths.dart';

class GenericApi<T, R> {
  final String endpoint;
  final List<int>? statusCode;
  final T? Function(R?) callback;
  final Map<String, dynamic>? body;

  final dio = Dio();

  GenericApi({
    required this.endpoint,
    required this.callback,
    this.body,
    this.statusCode = const [200],
  });

  static Options _headers() => Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });

  Future<T?> getAll() async {
    try {
      final response = await dio.get(
        endpoint,
        options: _headers(),
      );
      if (statusCode!.contains(response.statusCode)) {
        return callback(response.data);
      }
      return callback(null);
    } catch (e) {
      return null;
    }
  }

  Future<T?> create() async {
    try {
      String url = "${LocalAppPaths.urlApi}/$endpoint";
      final response = await dio.post(
        url,
        options: _headers(),
        data: json.encode(body),
      );

      if (statusCode!.contains(response.statusCode)) {
        return callback(response.data);
      }
      return callback(null);
    } on DioError catch (e) {
      if (statusCode!.contains(e.response?.statusCode)) {
        return callback(e.response?.data);
      }
      return callback(null);
    }
  }
}
