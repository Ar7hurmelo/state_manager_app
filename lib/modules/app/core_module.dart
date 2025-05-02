import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/dio/api_service.dart';
import '../../main.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton<ApiService>(() => ApiService());
    i.addLazySingleton<SharedPreferences>(() => prefs);
  }
}
