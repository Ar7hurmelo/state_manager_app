import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  final CounterController controller = Modular.get<CounterController>();

  final String userName;
  CounterPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    controller.getUserCounter(userName);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        backgroundColor: Color(0xffEB5A3C),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xffEB5A3C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<int>(
              valueListenable: controller.counter,
              builder:
                  (_, value, __) => Text(
                    'Count: $value',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE7D283),
              ),
              onPressed: controller.increment,
              child: Text('Add coin', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
