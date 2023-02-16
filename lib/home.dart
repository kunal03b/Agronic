import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool motor = false;
  bool val1 = false;
  bool val2 = false;

  onChangedFunction1(bool newValue1) {
    if (motor == true) {
      setState(() {
        motor = newValue1;
        val1 = true;
        val2 = true;
      });
    }
  }

  onChangedFunction2(bool newValue1) {
    if (val1 == true) {
      setState(() {
        val1 = false;
        val2 = true;
      });
    }
  }

  onChangedFunction3(bool newValue1) {
    // if (val1 == true) {
    setState(() {
      // val1 = false;
      // val2 = true;
    });
    // }
  }

  // onChangedFunction3(bool newValue3) {
  //   setState(() {
  //     val2 = newValue3;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              'Motor',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomSwitch(motor, onChangedFunction1),
            SizedBox(
              height: 30,
            ),
            Text(
              'Valve 1',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomSwitch(val1, onChangedFunction1),
            SizedBox(
              height: 30,
            ),
            Text(
              'Valve 2',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomSwitch(val2, onChangedFunction1),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ));
  }

  Widget CustomSwitch(bool val, Function onChangeMehod) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoSwitch(
            trackColor: Colors.red,
            activeColor: Colors.green,
            value: val,
            onChanged: (newValue) {
              onChangeMehod(newValue);
            })
      ],
    );
  }
}
