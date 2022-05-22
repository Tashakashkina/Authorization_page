// import 'package:shared_preferences/shared_preferences.dart';

// class UserPreferences {
//   static SharedPreferences? _preferences;

//   var _keyUsername = 'username';

//   Future init() async => _preferences = await SharedPreferences.getInstance();

//   Future setUsername(String username) async =>
//       await _preferences?.setString(_keyUsername, username);

//   String? getUsername() => _preferences?.getString(_keyUsername);
//   Future<bool>? deleteUsername() => _preferences?.remove(_keyUsername);
// }
