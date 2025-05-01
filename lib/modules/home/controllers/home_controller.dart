import 'package:flutter_modular/flutter_modular.dart';
import 'package:state_manager_app/modules/auth/controllers/auth_controller.dart';
import '../store/pokemon_store.dart';

class HomeController {
  final PokemonStore pokemonStore;

  HomeController({required this.pokemonStore});

  void logout() {
    Modular.get<AuthController>().logout();
  }

  String get user {
    return Modular.get<AuthController>().userLog;
  }
}
