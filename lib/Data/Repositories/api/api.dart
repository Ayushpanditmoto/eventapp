import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio();

  API() {
    _dio.options.baseUrl =
        'https://sde-007.api.assignment.theinternetfolks.works';
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get dio => _dio;

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, dynamic data) async {
    return await _dio.post(url, data: data);
  }

  Future<Response> put(String url, dynamic data) async {
    return await _dio.put(url, data: data);
  }

  Future<Response> delete(String url) async {
    return await _dio.delete(url);
  }
}
