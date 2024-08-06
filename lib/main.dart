import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_/cubits/get_weather_cubit/get_weather_states.dart';
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
        return BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            WeatherModel? weatherModel =
                BlocProvider.of<GetWeatherCubit>(context).weatherModel;

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor:
                        getChangeTheme(weatherModel?.weatherCondition),
                  ),
                  colorScheme: ColorScheme.fromSeed(
                      seedColor:
                          getChangeTheme(weatherModel?.weatherCondition))),
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getChangeTheme(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
      return Colors.amber;
    case "clear":
      return Colors.lightBlue;
    case "partly cloudy":
      return Colors.cyan;
    case "cloudy":
      return Colors.grey;
    case "overcast":
      return Colors.blueGrey;
    case "mist":
      return Colors.indigo;
    case "patchy rain possible":
      return Colors.lightGreen;
    case "patchy snow possible":
      return Colors.lightBlue;
    case "patchy sleet possible":
      return Colors.teal;
    case "patchy freezing drizzle possible":
    case "thundery outbreaks possible":
      return Colors.deepOrange;
    case "blowing snow":
    case "blizzard":
    case "fog":
      return Colors.grey;
    case "freezing fog":
      return Colors.blueGrey;
    case "patchy light drizzle":
    case "light drizzle":
      return Colors.green;
    case "freezing drizzle":
    case "heavy freezing drizzle":
      return Colors.cyan;
    case "patchy light rain":
    case "light rain":
    case "moderate rain at times":
      return Colors.blue;
    case "moderate rain":
      return Colors.blueGrey;
    case "heavy rain at times":
      return Colors.indigo;
    case "heavy rain":
    case "light freezing rain":
      return Colors.teal;
    case "moderate or heavy freezing rain":
    case "light sleet":
      return Colors.lightGreen;
    case "moderate or heavy sleet":
      return Colors.green;
    case "patchy light snow":
      return Colors.blue;
    case "light snow":
      return Colors.cyan;
    case "patchy moderate snow":
      return Colors.indigo;
    case "moderate snow":
    case "patchy heavy snow":
      return Colors.indigo;
    case "heavy snow":
    case "ice pellets":
      return Colors.cyan;
    case "light rain shower":
      return Colors.lightGreen;
    case "moderate or heavy rain shower":
      return Colors.green;
    case "torrential rain shower":
      return Colors.teal;
    case "light sleet showers":
    case "moderate or heavy sleet showers":
      return Colors.lightGreen;
    case "light snow showers":
      return Colors.lightBlue;
    case "moderate or heavy snow showers":
      return Colors.cyan;
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
      return Colors.cyan;
    case "patchy light rain with thunder":
      return Colors.orange;
    case "moderate or heavy rain with thunder":
      return Colors.deepOrange;
    case "patchy light snow with thunder":
      return Colors.blueGrey;
    case "moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
