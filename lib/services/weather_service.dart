import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:wether/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  /*baseUrl has been created because if i has more than 2 methods and i want changing path i will change baseUrl 
 instead of changing path for every method*/
  final String apiKey = 'a0f8e52f97f744d5b92141431240102';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMassage = e.response?.data['error']['message'] ??
          'oops there was an error,try later';
      throw Exception(errorMassage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error,try later');
    }
  }
}
