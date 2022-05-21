import 'package:flutter/material.dart';
import 'my_shared_preferences.dart';
import 'profile.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

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
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Пожалуйста, введите еmail";
                          }
                        },
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
                            hintText: "введите пароль",
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
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
