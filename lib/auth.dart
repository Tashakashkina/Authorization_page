import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_132/login.dart';
import 'my_shared_preferences.dart';
import 'profile.dart';
import 'dart:async';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthorState createState() => _AuthorState();
}

class _AuthorState extends State<Auth> {
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  dynamic getStorage = SharedPreferences.getInstance();

  String? _name;
  String? _password;

  Future<String?> getData() async {
    getStorage = await SharedPreferences.getInstance();
    dynamic name = await getStorage.get('username');
    dynamic password = await getStorage.get('password');
    setState(() {
      _name = name;
      _password = password;
    });
  }

  String? result() {
    if ((_name == controllerUserName.text) &&
        (_password == controllerPassword.text)) {
      return ('Привет, $_name! Хорошего дня!');
    } else if ((_name != controllerUserName.text) |
        (_password != controllerPassword.text)) {
      return ('Новый пользователь? Нажми на кнопку "Регистрация"');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
              margin: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Логин:", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "ввести логин",
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
                              hintText: "ввести пароль",
                            ),
                            obscureText: true,
                            controller: controllerPassword),
                      )
                    ],
                  ),
                  SizedBox(height: 100),
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
                        child: Text("Войти",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        onPressed: () {
                          setState(() {
                            getData();
                          });
                        }),
                  ),
                  SizedBox(height: 40),
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
                      child: Text("Регистрация",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const Login();
                          }),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 90,
                    width: 300,
                    child: (_name != null) & (_password != null)
                        ? Text('${result()}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen,
                            ))
                        : const Text(''),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
