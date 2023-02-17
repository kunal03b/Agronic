import 'package:agriculture/main.dart';
import 'package:agriculture/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      // validator: (){},
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      // validator: (){},
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/Sign_In.jpg',
          ),
        )),
        child: Center(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.5,
                                left: 35,
                                right: 35,
                              ),
                              child: Column(
                                children: [
                                  TextField(
                                    obscureText: false,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        prefixIcon: Icon(Icons.person),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        prefixIcon: Icon(Icons.lock),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
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
                                          FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text,
                                              password: passwordController.text).then((value) {
                                            Navigator.push(
                                                (context),
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Index()));
                                          }).onError((error, stackTrace) {
                                            print("Error ${error.toString()}");
                                          });

                                        },
                                        child: Center(
                                          child: Text(
                                            'Login',
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
                                      Text('Do not have an Account?'),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                (context),
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Sign_up()));
                                          },
                                          child: Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      // TextButton(
                                      //     onPressed: () {},
                                      //     child: Text(
                                      //       'Forgotton\nPassword',
                                      //       style: TextStyle(
                                      //           fontSize: 20,
                                      //           color: Colors.black),
                                      //     ))
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
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
