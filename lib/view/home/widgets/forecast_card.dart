import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecast/controller/service/model/weather_forecast_model.dart';
import 'package:weatherforecast/controller/utils/convert_icon.dart';
import 'package:weatherforecast/controller/utils/forecast_utils.dart';

Widget foreCastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forcastlist = snapshot.data!.list;
  var dayOfWeek = "";
  DateTime date =
      new DateTime.fromMillisecondsSinceEpoch(forcastlist[index].dt * 1000);
  var fullDate = Utils.getFormatDate(date);
  dayOfWeek = fullDate.split(",")[0];

  var sizedBox = const SizedBox(
    height: 5,
  );
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              child: getWeatherIcon(
                weatherDescription: forcastlist[0].weather[0].main,
                color: Colors.pinkAccent,
                size: 45,
              ),
            ),
          ),
          Column(
            children: [
              weatherCardDetail(
                "${forcastlist[index].main.tempMin.toStringAsFixed(0)}°F",
                // ignore: deprecated_member_use
                FontAwesomeIcons.solidArrowAltCircleDown,
              ),
              sizedBox,
              weatherCardDetail(
                "${forcastlist[index].main.tempMax.toStringAsFixed(0)}°F",
                // ignore: deprecated_member_use
                FontAwesomeIcons.solidArrowAltCircleUp,
              ),
              sizedBox,
              Text(
                  "Hum:${forcastlist[index].main.humidity.toStringAsFixed(0)}%"),
              sizedBox,
              Text(
                  "Hum:${forcastlist[index].wind.speed.toStringAsFixed(0)}mi/h")
            ],
          )
        ],
      )
    ],
  );
}

Row weatherCardDetail(String title, IconData icon) {
  return Row(
    children: [
      Text(title),
      Icon(
        icon,
        size: 15,
      ),
    ],
  );
}
