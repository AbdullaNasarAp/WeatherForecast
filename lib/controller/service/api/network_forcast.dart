import 'dart:convert';

import 'package:http/http.dart';
import 'package:weatherforecast/controller/service/model/weather_forecast_model.dart';
import 'package:weatherforecast/controller/utils/forecast_utils.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String? cityName}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=${cityName!}&appid=${Utils.appId}";
    final response = await get(Uri.parse(finalUrl));
    print("URL:${Uri.parse(finalUrl)}");

    if (response.statusCode == 200) {
      print("weather data : ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("error weather forecast");
    }
  }
}
