import 'package:acdc_weather_app/core/core.dart';

abstract class Parameters {
  Either<ValidationException, Parameters> validate();
}
