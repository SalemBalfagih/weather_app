import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_/model/weather_model.dart';

class WeatherServices {
  WeatherServices(this.dio);
  final Dio dio;

  Future<WeatherModel> getWeather({required String nameCity}) async {
    try {
      String baseUrl = "http://api.weatherapi.com/v1";
      String apiKey = "a0cb2d84748042f7a1b202804242707";
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$nameCity&days=1");
      WeatherModel weatherModel = WeatherModel.formJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']["message"] ??
          "oops something went wrong please try again";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops something went wrong please try again");
    }
  }
}
