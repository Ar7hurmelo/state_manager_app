import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app_module.dart';
import 'controllers/counter_controller.dart';
import 'ui/pages/counter_page.dart';

class CounterModule extends Module {
  @override
  List<Module> get imports => [
    AppModule(sharedPreferences: Modular.get<SharedPreferences>()),
  ];

  @override
  void binds(Injector i) {
    super.binds(i);

    i.addLazySingleton(() => CounterController(prefs: i<SharedPreferences>()));
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child(
      "/:user",
      child: (_) => CounterPage(userName: r.args.params["user"]),
    );
  }
}
