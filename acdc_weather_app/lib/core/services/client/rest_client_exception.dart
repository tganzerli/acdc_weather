import 'package:acdc_weather_app/core/core.dart';

class RestClientException extends HttpException
    implements RestClientHttpMessage {
  final dynamic data;
  final dynamic error;
  final RestClientResponse? response;

  RestClientException({
    required super.message,
    super.statusCode = 0,
    this.data,
    this.response,
    required this.error,
    super.stackTracing,
  });
}
