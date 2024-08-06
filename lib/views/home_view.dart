import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_/model/weather_model.dart';
import 'package:weather_app_/views/search_view.dart';
import 'package:weather_app_/widgets/no_weather_body.dart';
import 'package:weather_app_/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherinitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            // ignore: prefer_const_constructors
            return WeatherInfoBody();
          } else {
            return const Text("oops there was an error");
          }
        },
      ),
    );
  }
}
