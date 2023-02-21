// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Agronic());
}

class Agronic extends StatefulWidget {
  const Agronic({super.key});

  @override
  State<Agronic> createState() => _AgronicState();
}

class _AgronicState extends State<Agronic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'Login',
      routes: {'Login': (context) => Sign_In()},
      title: 'Agronic',
      debugShowCheckedModeBanner: false,
    );
  }
}

class Agronic1 extends StatefulWidget {
  const Agronic1({super.key});

  @override
  State<Agronic1> createState() => _Agronic1State();
}

class _Agronic1State extends State<Agronic1> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Sign_In();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}