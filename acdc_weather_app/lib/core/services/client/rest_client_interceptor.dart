import 'dart:async';

import 'package:acdc_weather_app/core/core.dart';

abstract interface class ClientInterceptor {
  FutureOr<RestClientHttpMessage> onResponse(RestClientResponse response);
  FutureOr<RestClientHttpMessage> onRequest(RestClientRequest request);
  FutureOr<RestClientHttpMessage> onError(RestClientException error);
}
