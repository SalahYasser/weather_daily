import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits%20=%3E%20get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits%20=%3E%20get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.weatherCondition),
        // backgroundColor: Colors.cyanAccent,
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
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const Center(
              child: Text('Oops, there was an error please try again'),
            );
          }
        },
      ),
    );
  }
}
