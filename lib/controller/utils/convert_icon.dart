import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon(
    {String? weatherDescription, Color? color, double? size}) {
  if (weatherDescription == "Clear") {
    return Icon(Icons.sunny, color: color, size: size);
  } else if (weatherDescription == "Cloud") {
    return Icon(FontAwesomeIcons.cloud, color: color, size: size);
  } else if (weatherDescription == "Rain") {
    return Icon(FontAwesomeIcons.cloudRain, color: color, size: size);
  } else if (weatherDescription == "Snow") {
    return Icon(FontAwesomeIcons.snowflake, color: color, size: size);
  } else {
    return Icon(Icons.sunny, color: color, size: size);
  }
}
