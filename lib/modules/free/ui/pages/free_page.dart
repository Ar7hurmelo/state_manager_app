import 'package:flutter/material.dart';

class FreePage extends StatelessWidget {
  const FreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free page"),
        backgroundColor: Color(0xffEB5A3C),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xffEB5A3C),
      body: Center(
        child: Text(
          "Pagina acessada fora do login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
