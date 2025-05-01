import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/auth_controller.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    final authController = Modular.get<AuthController>();

    return await authController.checkUserLogged();
  }
}
