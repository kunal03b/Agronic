import 'package:agriculture/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ListTile(
          //   leading: CircleAvatar(backgroundColor: Colors.black),
          //   title: Text('Hello World'),
          //   subtitle: Text('This is a subtitle'),
          //   trailing: Icon(Icons.edit_outlined),
          // ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 70,
                  ),
                  radius: 50,
                  backgroundColor: Colors.black,
                ),
              )),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 300,
                        child: Text(
                          'Vikas',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 300,
                        child: Text(
                          'vikasrana.rajput336@gmail.com',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5))),
                            onPressed: () async {
                                FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                                await firebaseAuth.signOut();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => const Login()));
                            },
                            child: Center(
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
