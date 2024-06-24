import 'package:acdc_weather_app/core/core.dart';
import 'package:dio/dio.dart';

import 'dio_interceptor_impl.dart';
import 'dio_adapter.dart';

class DioFactory {
  static Dio dio() {
    final Map<String, dynamic> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Charset': 'utf-8',
    };
    final baseOptions = BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      headers: headers,
    );
    return Dio(baseOptions);
  }
}

class RestClientDioImpl implements RestClient {
  final Dio _dio;

  final Map<ClientInterceptor, Interceptor> _interceptors = {};

  final Map<String, dynamic> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Charset': 'utf-8',
  };

  RestClientDioImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  void setBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }

  @override
  void cleanHeaders() {
    _dio.options.headers = headers;
  }

  @override
  void setHeaders(Map<String, dynamic> header) {
    _dio.options.headers.addAll(header);
  }

  @override
  void addInterceptors(ClientInterceptor interceptor) {
    _interceptors[interceptor] =
        ClientInterceptorDioImpl(interceptor: interceptor);
    _dio.interceptors.add(_interceptors[interceptor]!);
  }

  @override
  void removeInterceptors(ClientInterceptor interceptor) {
    _dio.interceptors.remove(_interceptors[interceptor]);
    _interceptors.remove(interceptor);
  }

  @override
  Future<RestClientResponse> delete(RestClientRequest request) async {
    try {
      final response = await _dio.delete(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<RestClientResponse> get(RestClientRequest request) async {
    try {
      final response = await _dio.get(
        request.path,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<RestClientResponse> patch(RestClientRequest request) async {
    try {
      final response = await _dio.patch(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<RestClientResponse> post(RestClientRequest request) async {
    try {
      final response = await _dio.post(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<RestClientResponse> put(RestClientRequest request) async {
    try {
      final response = await _dio.put(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }
}
