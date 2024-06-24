import 'base_exception.dart';

class DefaultException extends BaseException {
  const DefaultException({
    required super.message,
    super.stackTracing,
  });
}

class ValidationException extends BaseException {
  const ValidationException({
    required super.message,
    super.stackTracing,
  });
}

class HttpException extends BaseException {
  final int statusCode;
  const HttpException({
    required this.statusCode,
    required super.message,
    super.stackTracing,
  });
}
