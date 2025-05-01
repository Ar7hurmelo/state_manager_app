import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_manager_app/app/app_module.dart';
import 'package:state_manager_app/app/app_widget.dart';

import 'config/dio/api_service.dart';

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
