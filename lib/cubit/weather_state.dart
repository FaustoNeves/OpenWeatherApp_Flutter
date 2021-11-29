part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherAvailable extends WeatherState {
  final Weather weather;

  WeatherAvailable({required this.weather});
}

class WeatherError extends WeatherState {
  final dynamic exception;

  WeatherError({required this.exception});
}
