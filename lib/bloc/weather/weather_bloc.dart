// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:log_in_form_flutter/bloc/weather/weather_event.dart';
import 'package:log_in_form_flutter/bloc/weather/weather_state.dart';
import 'package:log_in_form_flutter/data/http_helper.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  HttpHelper httpHelper;
  WeatherBloc({
    required this.httpHelper,
  }) : super(WeatherState(status: WeatherStateStatus.initial)) {
    on<WeatherSubmitEvent>(_submit);
  }

  Future<void> _submit(WeatherSubmitEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStateStatus.loading));
    final result = await httpHelper.getWeather(event.city);
    // print(result.perceived);
    emit(state.copyWith(status: WeatherStateStatus.loaded, weather: result));
  }
}
