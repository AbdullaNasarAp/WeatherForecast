import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherforecast/controller/service/api/network_forcast.dart';
import 'package:weatherforecast/controller/service/model/weather_forecast_model.dart';
import 'package:weatherforecast/view/home/widgets/bottum_view.dart';
import 'package:weatherforecast/view/home/widgets/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel>? forecastObject;
  String _cityName = "delhi";

  @override
  void initState() {
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: <Widget>[
            textFormView(),
            Container(
                child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      midView(snapshot),
                      bottumView(snapshot, context)
                    ],
                  );
                } else {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget textFormView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              hintText: "Enter City Name",
              prefixIcon: const Icon(
                Icons.search,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              contentPadding: const EdgeInsets.all(8)),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String? cityName}) =>
      new Network().getWeatherForecast(cityName: _cityName);
}
