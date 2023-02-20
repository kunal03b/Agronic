import 'package:agriculture/sensor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:agriculture/reusable_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [Home1(), Sensor()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Agriculture',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        actions: [
          iconButton(context, Icons.logout_outlined, Colors.white, () async {
            FirebaseAuth firebaseAuth = FirebaseAuth.instance;
            await firebaseAuth.signOut();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Sign_In()));
          })
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              label: 'Sensor'),
        ],
      ),
    );
  }
}

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                   onTap: senddata,
              child:
              Text('Motor',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(height: 20),
            InkWell(
                onTap: senddata,
                child: CustomSwitch(motor, onChangedFunction1)),
            SizedBox(height: 30),
            InkWell(
              onTap: senddata,
            child:
            Text('Valve 1',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            ),

            SizedBox(height: 20),
            InkWell(
                onTap: senddata,
                child: CustomSwitch(val1, onChangedFunction2)),
            SizedBox(height: 30),
            Text('Valve 2',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 20),
            CustomSwitch(val2, onChangedFunction3),
ElevatedButton(onPressed: senddata, child: Text('Verify'))
          ],
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
              })],);
  }
   Future<dynamic>senddata ()async{
      final user =  await FirebaseDatabase.instance.ref().child('Test');
          user.set({
            // "id": "hello",
            "motor": motor,
            "val1":val1,
            "val2":val2,
          });
  }
}