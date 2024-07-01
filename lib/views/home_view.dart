import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wether/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:wether/views/search_view.dart';
import 'package:wether/widgets/no_weather.dart';
import 'package:wether/widgets/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return  WeatherInfoBody(weather: state.weatherModel,);
          } else {
            return const Text('oops, there was an error');
          }
        },
      ),
    );
  }
}
