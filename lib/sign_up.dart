import 'package:agriculture/login.dart';
import 'package:agriculture/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TextEditingController _emailController = TextEditingController();
    // TextEditingController _passwordController = TextEditingController();
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/Sign_In.jpg',
          ),
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            // appBar: AppBar(
            //   backgroundColor: Colors.transparent,
            //   leading: IconButton(
            //       onPressed: () {
            //         Navigator.pop((context),
            //             MaterialPageRoute(builder: (context) => Login()));
            //       },
            //       icon: Icon(Icons.arrow_back)),
            // ),
            body: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                // Row(
                //   children: [
                //     IconButton(
                //         onPressed: () {
                //           Navigator.pop((context),
                //               MaterialPageRoute(builder: (context) => Login()));
                //         },
                //         icon: Icon(Icons.arrow_back)),
                //   ],
                // ),
                // SingleChildScrollView(
                //   child:
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 300,
                          left: 35,
                          right: 35,
                        ),
                        child: Column(
                          children: [
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  hintText: 'Name',
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.person),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      padding: EdgeInsets.all(15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  onPressed: () {
                                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text,
                                        password: passwordController.text).then((value) {
                                          print("Created New Account");
                                    Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                    builder: (context) => Index()));
                                    }).onError((error, stackTrace) {
                                      print("Error ${error.toString()}");
                                    });

                                  },
                                  child: Center(
                                    child: Text(
                                      'Create New Account',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Do have an Account'),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          (context),
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgotton Password',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                // ),
              ]),
            ))));
  }
}
