import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wether/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;
  
  @override
  Widget build(BuildContext context) {
  WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration:const BoxDecoration(
        gradient: LinearGradient(
         colors: [Colors.orange,Colors.pink] ,
          begin:Alignment.topCenter
        ,end: Alignment.bottomCenter )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              'Updated At ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style:const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weatherModel.image!}'),
                 Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'MaxTemp:${weatherModel.maxTemp.round()}',
                      style:const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'MiniTemp:${weatherModel.minTemp.round()}',
                      style:const TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            ),
             Text(
              weatherModel.weatherCondition,
              style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
