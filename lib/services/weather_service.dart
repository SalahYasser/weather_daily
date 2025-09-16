import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'c49f7779f63f43a6ae5162810240308';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&days=1&q=$cityName');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;

    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['Message'] ??
          'Oop There was an error, Please try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oop There was an error, Please try later');
    }
  }
}
