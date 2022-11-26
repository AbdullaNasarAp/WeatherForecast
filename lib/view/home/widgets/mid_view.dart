import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecast/controller/service/model/weather_forecast_model.dart';
import 'package:weatherforecast/controller/utils/convert_icon.dart';
import 'package:weatherforecast/controller/utils/forecast_utils.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  const MidView({super.key, required this.snapshot});
  @override
  Widget build(BuildContext context) {
    var sizedBox = const SizedBox(width: 20);
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "${snapshot.data!.city.name},${snapshot.data!.city.country}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Text(
          Utils.getFormatDate(new DateTime.fromMillisecondsSinceEpoch(
              snapshot.data!.list[0].dt * 1000)),
          style: const TextStyle(fontSize: 17),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: getWeatherIcon(
              weatherDescription: snapshot.data!.list[0].weather[0].main,
              color: Colors.pinkAccent,
              size: 195),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${snapshot.data!.list[0].main.temp.toStringAsFixed(0)}°F",
                style: const TextStyle(fontSize: 32),
              ),
              sizedBox,
              Text(snapshot.data!.list[0].weather[0].description.toUpperCase())
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            More(
                more: "${snapshot.data!.list[0].wind.speed}mi/h",
                fontAwesomeIcons: FontAwesomeIcons.wind),
            sizedBox,
            More(
                more: "${snapshot.data!.list[0].main.humidity}%",
                fontAwesomeIcons: FontAwesomeIcons.droplet),
            sizedBox,
            More(
                more: "${snapshot.data!.list[0].main.temp}°F",
                fontAwesomeIcons: FontAwesomeIcons.temperatureThreeQuarters),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
    ;
  }
}

class More extends StatelessWidget {
  More({Key? key, required this.more, required this.fontAwesomeIcons})
      : super(key: key);

  final String more;
  final IconData fontAwesomeIcons;
  var sizedBox = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizedBox,
        Text(more),
        sizedBox,
        Icon(
          fontAwesomeIcons,
          size: 30,
          color: Colors.white,
        )
      ],
    );
  }
}
