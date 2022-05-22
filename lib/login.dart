import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_shared_preferences.dart';
import 'profile.dart';
import 'dart:async';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  dynamic localStoragePass = SharedPreferences.getInstance();
  dynamic localStorageName = SharedPreferences.getInstance();

  void saveName() async {
    localStorageName = await SharedPreferences.getInstance();
    await localStorageName.setString(
        'username', controllerUserName.text.toString());
    await localStorageName.setString(
        'password', controllerPassword.text.toString());
  }

  void savePass() async {
    localStoragePass = await SharedPreferences.getInstance();
    await localStoragePass.setString(
        'username', controllerUserName.text.toString());
    await localStoragePass.setString(
        'password', controllerPassword.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Email:", style: TextStyle(fontSize: 18)),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: controllerEmail,
                        decoration: InputDecoration(
                          hintText: "введите email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Логин:", style: TextStyle(fontSize: 18)),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "введите логин",
                          ),
                          controller: controllerUserName),
                    )
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Пароль:", style: TextStyle(fontSize: 18)),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "введите пароль",
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Пожалуйста, введите пароль";
                            }
                          },
                          controller: controllerPassword),
                    )
                  ],
                ),
                const SizedBox(height: 100),
                Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(5, 5),
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5, -5),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.pink.shade100,
                        Colors.pink.shade200,
                        Colors.lightGreen.shade400,
                        Colors.lightGreen.shade600,
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const Text("Отправить",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    onPressed: () {
                      saveName();
                      savePass();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
