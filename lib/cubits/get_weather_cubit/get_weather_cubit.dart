import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_/model/weather_model.dart';
import 'package:weather_app_/services/weather_services.dart';
import 'package:weather_app_/views/search_view.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherinitialState());
  WeatherModel? weatherModel;
  getWeather({required String nameCity}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getWeather(nameCity: nameCity);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState(errMessage: e.toString()));
    }
  }
}
