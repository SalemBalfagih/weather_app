import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_/model/weather_model.dart';
import 'package:weather_app_/services/weather_services.dart';

class SearchView extends StatelessWidget {
  const SearchView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Search city"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onSubmitted: (value) async {
            var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
            getweathercubit.getWeather(nameCity: value);
            Navigator.of(context).pop();
          },
          decoration: InputDecoration(
            suffix: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            hintText: "seach city",
            label: const Text("Enter New City"),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      )),
    );
  }
}
