import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_flutter/service/weather_service.dart';

import '../data/models/weather/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService _weatherService;

  WeatherCubit(this._weatherService) : super(WeatherInitial());

  void fetchWeather(String? cityName) {
    {
      emit(WeatherInitial());
    }
    _weatherService
        .fetchWeather(cityName)
        .then((value) => {
              if (Weather.fromMap(value).runtimeType == Weather)
                {emit(WeatherAvailable(weather: Weather.fromMap(value)))}
              else
                {emit(WeatherError(exception: value))}
            })
        .onError((error, stackTrace) => {
              {emit(WeatherError(exception: error))}
            });
  }
}

