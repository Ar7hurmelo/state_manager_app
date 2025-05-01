import 'package:flutter_modular/flutter_modular.dart';
import 'package:state_manager_app/modules/home/repositories/i_pokemon_repository.dart';
import 'package:state_manager_app/modules/home/repositories/impl/pokemon_repository.dart';

import '../../config/dio/api_service.dart';
import 'controllers/home_controller.dart';
import 'service/pokemon_service.dart';
import 'store/pokemon_store.dart';
import 'ui/pages/home_page.dart';

class HomeModule extends Module {
  final ApiService apiService;

  HomeModule({required this.apiService});

  @override
  void binds(Injector i) {
    super.binds(i);

    i.addLazySingleton(() => ApiService());

    i.addLazySingleton<IPokemonRepository>(
      () => PokemonRepository(apiService: i<ApiService>()),
    );
    i.addLazySingleton(() => PokemonService(iPokemonRepository: i()));
    i.addLazySingleton(() => PokemonStore(pokemonService: i()));
    i.addLazySingleton(() => HomeController(pokemonStore: i()));
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child("/", child: (_) => HomePage());
  }
}
