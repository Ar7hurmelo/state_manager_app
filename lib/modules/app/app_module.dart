import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/auth_module.dart';
import '../auth/controllers/auth_controller.dart';
import '../auth/guard/auth_guard.dart';
import '../auth/guard/counter_guard.dart';
import '../counter/counter_module.dart';
import '../free/free_module.dart';
import '../home/home_module.dart';
import 'core_module.dart';

class AppModule extends Module {
  final SharedPreferences sharedPreferences;

  AppModule({required this.sharedPreferences});

  @override
  List<Module> get imports => [
    CoreModule(sharedPreferences: sharedPreferences),
  ];

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.module("/", module: AuthModule());
    r.module("/home", module: HomeModule(), guards: [AuthGuard()]);
    r.module(
      "/counter",
      module: CounterModule(),
      guards: [AuthGuard(), CounterGuard()],
    );
    r.module("/free", module: FreeModule());
  }

  @override
  void exportedBinds(i) {
    i.addSingleton(() => AuthController(prefs: i<SharedPreferences>()));
  }
}
