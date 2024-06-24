import 'package:acdc_weather_app/core/core.dart';

abstract class ValueObject<T> {
  final T value;

  ValueObject(
    this.value,
  );

  Either<ValidationException, ValueObject<T>> validate();

  @override
  String toString() => '$runtimeType: $value';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ValueObject<T> && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
