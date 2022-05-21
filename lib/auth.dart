import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_132/login.dart';
import 'my_shared_preferences.dart';
import 'profile.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AuthState();
  }
}

class AuthState extends State<Auth> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  Future<bool> _signIn(String username, String password) async {
    bool _signedIn = false;
    var _p = await SharedPreferences.getInstance();
    if ((_p.getString('username') == username) &&
        (_p.getString('password') == password)) {
      _signedIn = true;
    } else {
      _signedIn = false;
    }
    return _signedIn;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(25),
          child: Form(
            key: formKey,
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
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Пожалуйста, введите логин";
                            }
                          },
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
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Пожалуйста, введите пароль";
                            }
                          },
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
                          if (formKey.currentState!.validate()) {
                            var getEmail = controllerEmail.text;
                            var getUserName = controllerUserName.text;
                            var getPassword = controllerPassword.text;
                            MySharedPreferences.instance
                                .setStringValue("email", getEmail);
                            MySharedPreferences.instance
                                .setStringValue("username", getUserName);
                            MySharedPreferences.instance
                                .setStringValue("password", getPassword);
                            MySharedPreferences.instance
                                .setBooleanValue("loggedin", true);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => Profile()),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => Login()),
                            );
                          }
                        })),
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
                        _signIn(controllerUserName.text,
                                controllerPassword.text)
                            .then((value) {
                          if (value == true) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => Profile()),
                            );
                          }
                        });
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
