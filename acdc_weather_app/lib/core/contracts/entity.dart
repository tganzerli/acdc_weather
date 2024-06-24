import 'package:acdc_weather_app/core/core.dart';

abstract class Entity {
  final String? id;

  Entity(this.id);

  Either<ValidationException, Entity> validate();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Entity && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
