import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:state_manager_app/modules/auth/controllers/auth_controller.dart';

class CounterGuard extends RouteGuard {
  CounterGuard() : super(redirectTo: '/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    final authController = Modular.get<AuthController>();

    final user = path.split("/").last;

    return await authController.checkUserLoggedToRouter(user);
  }
}
