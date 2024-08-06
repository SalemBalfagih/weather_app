import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_/model/weather_model.dart';
import 'package:weather_app_/views/home_view.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        WeatherModel? weatherModel =
            BlocProvider.of<GetWeatherCubit>(context).weatherModel;

        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          // appBarTheme: AppBarTheme(
          //   backgroundColor: getChangeTheme(weatherModel.weatherCondition),
          // ),
          // colorScheme: ColorScheme.fromSeed(
          //     seedColor: getChangeTheme(weatherModel.weatherCondition)))
          // ,
          home: HomeView(),
        );
      }),
    );
  }
}
