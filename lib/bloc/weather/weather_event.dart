// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class WeatherEvent {}

class WeatherSubmitEvent extends WeatherEvent {
  final String city;
  WeatherSubmitEvent({
    required this.city,
  });
}
