import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_flutter/data/models/weather/weather.dart';
import 'package:weather_app_flutter/data/repository/weather_repository.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  final WeatherRepository weatherRepository;

  GetWeatherCubit(this.weatherRepository) : super(GetWeatherInitial());
}
