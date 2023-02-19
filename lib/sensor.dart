import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';

class Sensor extends StatefulWidget {
  const Sensor({super.key});

  @override
  State<Sensor> createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  bool isDataLoaded = false;
  String sensorOne = '0';
  DatabaseReference sensorOneRef = FirebaseDatabase.instance.ref('sensorOne');

  void getData() async {
    // final snapshot = await ref.child('sensorOne').get();
    // setState(() {
    //   sensorOne = snapshot.value.toString();
    // });

    sensorOneRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        sensorOne = event.snapshot.value.toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
                isDataLoaded ? CircularProgressIndicator() : Text(sensorOne),
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

        ],
      ),
    ));
  }
}
