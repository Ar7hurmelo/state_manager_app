import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/dio/api_service.dart';
import 'ui/pages/login_page.dart';

class AuthModule extends Module {
  final ApiService apiService;
  final SharedPreferences prefs;

  AuthModule({required this.prefs, required this.apiService});

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
