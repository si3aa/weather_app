import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:wether/models/weather_model.dart';
import 'package:wether/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel ?weatherModel;

  getWeather({required String cityName}) async {
    try {
     weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(
        e.toString()
      ),);
    }
  }
}
