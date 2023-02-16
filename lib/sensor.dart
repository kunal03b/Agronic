import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Sensor extends StatefulWidget {
  const Sensor({super.key});

  @override
  State<Sensor> createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: ListView(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Text(
                  'Humidity',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.percent,
                  size: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CircularPercentIndicator(
            radius: 100,
            lineWidth: 20,
            percent: 0.4,
            progressColor: Colors.blue.shade700,
          ),
        ],
      ),
    ));
  }
}
