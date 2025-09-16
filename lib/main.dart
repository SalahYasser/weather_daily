import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits%20=%3E%20get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits%20=%3E%20get_weather_cubit/get_weather_states.dart';
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
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition)
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;
    case 'Clear':
      return Colors.blue;
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
      return Colors.lightBlue;
    case 'Patchy sleet possible':
      return Colors.blueGrey;
    case 'Patchy freezing drizzle possible':
      return Colors.blueGrey;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.lightBlue;
    case 'Fog':
      return Colors.blueGrey;
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy light drizzle':
      return Colors.lightBlue;
    case 'Light drizzle':
      return Colors.lightBlue;
    case 'Freezing drizzle':
      return Colors.blueGrey;
    case 'Heavy freezing drizzle':
      return Colors.blueGrey;
    case 'Patchy light rain':
      return Colors.lightBlue;
    case 'Light rain':
      return Colors.blue;
    case 'Moderate rain at times':
      return Colors.blue;
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain at times':
      return Colors.blue;
    case 'Heavy rain':
      return Colors.blue;
    case 'Light freezing rain':
      return Colors.blueGrey;
    case 'Moderate or heavy freezing rain':
      return Colors.blueGrey;
    case 'Light sleet':
      return Colors.blueGrey;
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
      return Colors.blueGrey;
    case 'Light snow':
      return Colors.lightBlue;
    case 'Patchy moderate snow':
      return Colors.lightBlue;
    case 'Moderate snow':
      return Colors.lightBlue;
    case 'Patchy heavy snow':
      return Colors.lightBlue;
    case 'Heavy snow':
      return Colors.lightBlue;
    case 'Ice pellets':
      return Colors.blueGrey;
    case 'Light rain shower':
      return Colors.lightBlue;
    case 'Moderate or heavy rain shower':
      return Colors.blue;
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Light sleet showers':
      return Colors.blueGrey;
    case 'Moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'Light snow showers':
      return Colors.lightBlue;
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'Light showers of ice pellets':
      return Colors.blueGrey;
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    case 'Patchy light rain with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy light snow with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
