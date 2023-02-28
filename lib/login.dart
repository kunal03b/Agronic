import 'package:agriculture/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agriculture/reusable_widget.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void checkCurrentUser() async {
    final currentUser = await FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Navigator.pushReplacement(
          (context), MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        _emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: _passwordController,
      onSaved: (value) {
        _passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              right: 20,
              left: 20,
              bottom: 20),
          child: Column(
            children: [
              logo('assets/Logo.png'),
              textField('Email', Icons.person, false, _emailController),
              SizedBox(height: 10),
              textField('Password', Icons.lock, true, _passwordController),
              SizedBox(
                height: 10,
              ),
              elevatedButton(context, true, ()
                  // async
                  {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) {
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => Home()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
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
    ));
  }
}

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
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
              logo('assets/Logo.png'),
              textField('Name', Icons.person, false, _nameController),
              textField('Email', Icons.email_rounded, false, _emailController),
              SizedBox(height: 10),
              textField('Password', Icons.lock, true, _passwordController),
              SizedBox(
                height: 10,
              ),
              elevatedButton(context, false, () {
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
