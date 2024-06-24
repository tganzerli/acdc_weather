import 'package:acdc_weather_app/core/core.dart';

class RestClientException extends BaseException
    implements RestClientHttpMessage {
  final dynamic data;
  final int? statusCode;
  final dynamic error;
  final RestClientResponse? response;

  RestClientException({
    required super.message,
    this.statusCode,
    this.data,
    this.response,
    required this.error,
    super.stackTracing,
  });
}
