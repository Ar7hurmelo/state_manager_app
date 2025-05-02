import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/dio/api_service.dart';
import '../auth/auth_module.dart';
import '../auth/controllers/auth_controller.dart';
import '../auth/guard/auth_guard.dart';
import '../auth/guard/counter_guard.dart';
import '../counter/counter_module.dart';
import '../free/free_module.dart';
import '../home/home_module.dart';

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

  // @override
  // void exportedBinds(i) {
  //   i.addLazySingleton<ApiService>(() => apiService);
  //   i.addLazySingleton<SharedPreferences>(() => prefs);

  //   i.addLazySingleton(() => AuthController(prefs: i<SharedPreferences>()));
  // }
}
