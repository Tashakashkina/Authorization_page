// import 'package:flutter/material.dart';
// import 'package:week_132/auth.dart';
// import 'my_shared_preferences.dart';
// import 'login.dart';
// import 'package:week_132/login.dart';

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//   @override
//   _ProfileState createState() => _ProfileState();
    
// }
// class _ProfileState extends State<Profile> {
//   String email = "";
//   String username = "";
  

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "Hello, _name",
//                   style: TextStyle(
//                     fontSize: 60,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 SizedBox(height: 80),
//                 SizedBox(
//                   width: 150,
//                   height: 50,
//                   child: TextButton(
//                       child: Text("Выйти",
//                           style: TextStyle(
//                               color: Colors.lightGreen.shade600, fontSize: 25)),
//                       onPressed: () {
//                         MySharedPreferences.instance.removeAll();
//                         Navigator.pushReplacement(
//                             context, MaterialPageRoute(builder: (_) => Auth()));
//                       }),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
