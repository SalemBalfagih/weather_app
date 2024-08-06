import 'package:weather_app_/model/weather_model.dart';

class WeatherStates {}

class WeatherinitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {}

class WeatherFailureState extends WeatherStates {
  final String errMessage;

  WeatherFailureState({required this.errMessage});
}
