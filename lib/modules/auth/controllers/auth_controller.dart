import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final SharedPreferences prefs;

  AuthController({required this.prefs});

  String userLog = "";

  void login(String userName) async {
    if (userName.isEmpty) return;

    prefs.setString("login", userName); // login != vazio > logado

    userLog = userName;
    Modular.to.pushReplacementNamed("/home/");
  }

  void logout() async {
    prefs.setString("login", "");
    userLog = "";
    Modular.to.pushNamedAndRemoveUntil("/", (_) => false);
  }

  Future<bool> checkUserLogged() async {
    userLog = prefs.getString("login") ?? "";
    return userLog.isNotEmpty;
  }

  Future<bool> checkUserLoggedToRouter(String user) async {
    userLog = prefs.getString("login") ?? "";
    return userLog == user;
  }
}
