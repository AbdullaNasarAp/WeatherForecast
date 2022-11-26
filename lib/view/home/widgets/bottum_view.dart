import 'package:flutter/material.dart';
import 'package:weatherforecast/controller/service/model/weather_forecast_model.dart';
import 'package:weatherforecast/view/home/widgets/forecast_card.dart';

class BottumView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  const BottumView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "7 - Weather Forecast ".toUpperCase(),
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 15,
                );
              },
              itemCount: snapshot.data!.list.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      15,
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 160,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: foreCastCard(snapshot, index),
                  ),
                );
              }),
        )
      ],
    );
  }
}
