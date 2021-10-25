part of 'get_weather_cubit.dart';

@immutable
abstract class GetWeatherState {}

class GetWeatherInitial extends GetWeatherState {}

class WeatherLoaded extends GetWeatherState {
  final Weather weather;

  WeatherLoaded({required this.weather});
}
