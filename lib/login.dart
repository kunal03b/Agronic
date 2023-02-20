import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agriculture/reusable_widget.dart';
import 'Home.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
        required String password,
        required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              right: 20,
              left: 20,
              bottom: 20),
          child: Column(
            children: [
              logo('assets/Icon.png'),
              textField('Email', Icons.person, false, _emailController),
              SizedBox(height: 10),
              textField('Password', Icons.lock, true, _passwordController),
              SizedBox(
                height: 10,
              ),
              elevatedButton(context, true, () async {
                User? user = await loginUsingEmailPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context);
                print(user);
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
                }
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Do not have an account?'),
                  textButton(true, () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sign_Up()));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  // static Future<User?> loginUsingEmailPassword(
  //     {required String email,
  //     required String password,
  //     required BuildContext context}) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try {
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "user-not-found") {
  //       print("No User found for that email");
  //     }
  //   }
  //   return user;
  // }
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              right: 20,
              left: 20,
              bottom: 20),
          child: Column(
            children: [
              logo('assets/Icon.png'),
              textField(
                  'Name', Icons.person, false, _nameController),
              textField('Email', Icons.person, false, _emailController),
              SizedBox(height: 10),
              textField('Password', Icons.lock, true, _passwordController),
              SizedBox(
                height: 10,
              ),
              elevatedButton(context, false, ()
              // async
              {
                // User? user = await loginUsingEmailPassword(
                //     email: _emailController.text,
                //     password: _passwordController.text,
                //     context: context);
                // print(user);
                // if (user != null) {
                //   Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(builder: (context) => Home()));
                // }
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text)
                    .then((value) {
                  print("Created New Account");
                  Navigator.pop((context),
                      MaterialPageRoute(builder: (context) => Home()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Do have an account?'),
                  textButton(false, () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => Sign_In()));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}