// import 'package:agriculture/sensor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:agriculture/reusable_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool motor = false;
  bool val1 = false;
  bool val2 = false;

  //Moisture Data
  bool isDataLoaded = false;
  String Moisture = '0';
  var result = 0.9;
  DatabaseReference MoistureRef =
  FirebaseDatabase.instance.ref('Moisture');
  void getData() async {
    MoistureRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        Moisture = event.snapshot.child('Moisture').value.toString();
        result = double.tryParse(Moisture)!;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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

  sendMotorStatus(bool motorStatus) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('Test/motor');
    await ref.set({
      "motor" : motorStatus
    });
    print('Sent motor value: $motor');
  }
  sendVal1Status(bool val1Status) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('Test/Val1');
    await ref.set({
      "motor" : val1Status
    });
    print('Sent Valve1 value: $val1');
  }
  sendVal2Status(bool val2Status) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('Test/Val2');
    await ref.set({
      "motor" : val2Status
    });
    print('Sent Valve2 value: $val2');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
           iconButton(context, Icons.logout_outlined, Colors.white, () async {
             FirebaseAuth firebaseAuth = FirebaseAuth.instance;
             await firebaseAuth.signOut();
             Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context) => const Sign_In()));
           })
        ],
          backgroundColor: Colors.black,
          title: Text(
            '  Agronic',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black)],
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 130,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [

                      // sendMotorStatus(motor);

                      Text(
                        'Motor',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Spacer(),
                      InkWell(onTap: senddata,
                        child: CustomSwitch(motor, onChangedFunction1)),
                    ]),
                    Spacer(),
                    Text(
                      'Some details about this motor.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black)],
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(20),
                    height: 110,
                    width: 150,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Valve 1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Spacer(),
                    InkWell(onTap: senddata,
                        child:CustomSwitch(val1, onChangedFunction2),),
                        ]),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black)],
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 110,
                    width: 150,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Valve 2',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Spacer(),
                    InkWell(onTap: senddata,
                        child:CustomSwitch(val2, onChangedFunction3),),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      height: 45,
                      width: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: senddata,
                          child: Text(
                            'Verify',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sensor Data >',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Humidity',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  // Spacer(),
                  isDataLoaded
                      ? CircularProgressIndicator()
                      : Text(Moisture),
                  Icon(Icons.percent)
                ],
              ),
              SizedBox(
                height: 40,
              ),
              LinearPercentIndicator(
                lineHeight: 10,
                progressColor: Colors.black,
                percent: result/100,
                barRadius: Radius.circular(10),
                animation: true,
                animationDuration: 1000,
              )
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
  Future<dynamic> senddata() async {
    final user = await FirebaseDatabase.instance.ref().child('Test');
    user.set({
      // "id": "hello",
      "motor": motor,
      "val1": val1,
      "val2": val2,
    });
  }
}
