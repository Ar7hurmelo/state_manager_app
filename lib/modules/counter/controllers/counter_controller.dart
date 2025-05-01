import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterController {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  String key = "";

  final SharedPreferences prefs;

  CounterController({required this.prefs});

  void getUserCounter(String userName) async {
    if (prefs.containsKey(userName)) {
      counter.value = prefs.getInt(userName) ?? 0;
    }
    key = userName;
  }

  void increment() {
    counter.value++;
    prefs.setInt(key, counter.value);
  }
}
