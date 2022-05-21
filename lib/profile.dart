import 'package:flutter/material.dart';
import 'package:week_132/auth.dart';
import 'my_shared_preferences.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  String email = "";
  String username = "";

  ProfileState() {
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
              email = value;
            }));
    MySharedPreferences.instance
        .getStringValue("username")
        .then((value) => setState(() {
              username = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Hello, " + username,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(height: 80),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextButton(
                      child: Text("Выйти",
                          style: TextStyle(
                              color: Colors.lightGreen.shade600, fontSize: 25)),
                      onPressed: () {
                        MySharedPreferences.instance.removeAll();
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => Auth()));
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
