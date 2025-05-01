import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController controller = Modular.get<AuthController>();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(0xffEB5A3C),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xffEB5A3C),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Icon(
                Icons.paid,
                size: 100,
                color: Color(0xffE7D283),
                shadows: [Shadow(blurRadius: 5)],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Usuário",
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffE7D283),
                ),
                onPressed: () {
                  controller.login(textEditingController.text);
                },
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffE7D283),
                ),
                onPressed: () {
                  Modular.to.pushNamed("/free/");
                },
                child: Text("Free", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
