import 'package:acdc_weather_app/core/core.dart';

abstract class DTO {
  Either<ValidationException, DTO> validate();
}
