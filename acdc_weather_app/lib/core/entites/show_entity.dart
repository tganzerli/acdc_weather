import 'package:acdc_weather_app/core/core.dart';

class ShowEntity extends Entity {
  final String city;
  final String country;
  final DateTime date;
  ShowEntity(
    super.id, {
    required this.city,
    required this.country,
    required this.date,
  });

  @override
  Either<ValidationException, ShowEntity> validate() {
    if (city.isEmpty) {
      return left(
          const ValidationException(message: 'The city cannot be empty'));
    }
    if (country.isEmpty) {
      return left(
          const ValidationException(message: 'The country cannot be empty'));
    }
    return right(this);
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'country': country,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory ShowEntity.fromMap(Map<String, dynamic> map) {
    return ShowEntity(
      '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }
}
