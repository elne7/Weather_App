import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseURL = 'https://api.weatherapi.com/v1';
  final String apiKey = '6d1ba1f920944ec7ad7133818241010';

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ?? 'Oops there was an error, Try again later' ;
      throw Exception(errorMessage);
    } catch (e){
      log(e.toString());
      throw Exception('Oops there was an error, Try again later');
    }

  }
}
