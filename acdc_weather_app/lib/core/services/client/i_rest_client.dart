import 'rest_client_interceptor.dart';
import 'rest_client_request.dart';
import 'rest_client_response.dart';

abstract interface class RestClient {
  Future<RestClientResponse> post(RestClientRequest request);

  Future<RestClientResponse> get(RestClientRequest request);

  Future<RestClientResponse> put(RestClientRequest request);

  Future<RestClientResponse> delete(RestClientRequest request);

  Future<RestClientResponse> patch(RestClientRequest request);

  void setBaseUrl(String url);

  void cleanHeaders();

  void setHeaders(Map<String, dynamic> header);

  void addInterceptors(ClientInterceptor interceptor);

  void removeInterceptors(ClientInterceptor interceptor);
}
