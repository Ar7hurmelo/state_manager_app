import 'package:flutter_modular/flutter_modular.dart';
import 'package:state_manager_app/modules/auth/controllers/auth_controller.dart';

import '../store/pokemon_store.dart';

class HomeController {
  // final AuthController authController;
  final PokemonStore pokemonStore;

  HomeController({
    //  required this.authController,
    required this.pokemonStore,
  });

  void logout() {
    Modular.get<AuthController>().logout();
    // authController.logout();
  }

  String get user {
    return Modular.get<AuthController>().userLog;
    // return authController.userLog;
  }
}
