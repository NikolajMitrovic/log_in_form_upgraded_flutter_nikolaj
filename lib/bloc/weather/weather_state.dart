// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:log_in_form_flutter/data/weather.dart';

enum WeatherStateStatus {
  initial,
  loading,
  loaded,
}

class WeatherState {
  final WeatherStateStatus status;
  final Weather? weather;

  WeatherState({
    required this.status,
    this.weather,
  });

  WeatherState copyWith({
    WeatherStateStatus? status,
    Weather? weather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
    );
  }
}
