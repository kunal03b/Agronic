import 'package:agriculture/sensor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:agriculture/reusable_widget.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  bool motor = false;
  bool val1 = false;
  bool val2 = false;

  onChangedFunction1(bool newValue1) {
    setState(() {
      motor = newValue1;
    });
  }

  onChangedFunction2(bool newValue2) {
    setState(() {
      val1 = newValue2;
    });
  }

  onChangedFunction3(bool newValue3) {
    setState(() {
      val2 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Agronic',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 310,
                child: Row(
                  children: [
                    Text(
                      'Motor',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    CustomSwitch(motor, onChangedFunction1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
