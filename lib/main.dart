import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/dio/api_service.dart';
import 'modules/app/app_module.dart';
import 'modules/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ApiService apiService = ApiService.instance;
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    ModularApp(
      module: AppModule(prefs: prefs, apiService: apiService),
      child: AppWidget(),
    ),
  );
}
