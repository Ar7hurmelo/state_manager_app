import 'package:flutter_modular/flutter_modular.dart';

import '../app/app_module.dart';
import 'ui/pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child('/', child: (_) => LoginPage());
  }
}
