import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        theme: ThemeData(
          // primaryColor: getThemeColor();
        ),
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }

  MaterialColor getThemeColor(String condition) {
    switch (condition.toLowerCase()) {
      case "sunny":
        return Colors.yellow;
      case "partly cloudy":
        return Colors.blueGrey;
      case "cloudy":
      case "patchy light snow with thunder":
      case "moderate or heavy snow with thunder":
        return Colors.grey;
      case "overcast":
      case "mist":
        return Colors.blue;
      case "patchy rain possible":
      case "light rain":
      case "patchy light rain":
        return Colors.lightBlue;
      case "heavy rain":
        return Colors.blue;
      case "blowing snow":
      case "blizzard":
      case "light snow":
      case "heavy snow":
        return Colors.grey;
      case "patchy light rain with thunder":
      case "moderate or heavy rain with thunder":
        return Colors.deepOrange;
      default: // Fallback for unknown conditions
        return Colors.blue;
    }
  }
}
