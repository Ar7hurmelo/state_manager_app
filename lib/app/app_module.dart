import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/dio/api_service.dart';
import '../modules/auth/auth_module.dart';
import '../modules/auth/controllers/auth_controller.dart';
import '../modules/auth/guard/auth_guard.dart';
import '../modules/auth/guard/counter_guard.dart';
import '../modules/counter/counter_module.dart';
import '../modules/free/free_module.dart';
import '../modules/home/home_module.dart';

class AppModule extends Module {
  final ApiService apiService;
  final SharedPreferences prefs;

  AppModule({required this.prefs, required this.apiService});

  @override
  void binds(Injector i) {
    super.binds(i);

    i.addLazySingleton<ApiService>(() => apiService);
    i.addLazySingleton<SharedPreferences>(() => prefs);

    i.addLazySingleton(() => AuthController(prefs: prefs));
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.module("/", module: AuthModule(prefs: prefs, apiService: apiService));
    r.module(
      "/home",
      module: HomeModule(apiService: apiService),
      guards: [AuthGuard()],
    );
    r.module(
      "/counter",
      module: CounterModule(prefs: prefs),
      guards: [AuthGuard(), CounterGuard()],
    );
    r.module("/free", module: FreeModule());
  }

  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
  }
}
