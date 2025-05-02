import 'package:flutter_modular/flutter_modular.dart';
import 'package:state_manager_app/modules/auth/controllers/auth_controller.dart';
import 'package:state_manager_app/modules/home/repositories/i_pokemon_repository.dart';
import 'package:state_manager_app/modules/home/repositories/impl/pokemon_repository.dart';

import '../../config/dio/api_service.dart';
import '../app/app_module.dart';
import 'controllers/home_controller.dart';
import 'service/pokemon_service.dart';
import 'store/pokemon_store.dart';
import 'ui/pages/home_page.dart';
import 'ui/pages/pokemon_detail_page.dart';

class HomeModule extends Module {
  final ApiService apiService;

  HomeModule({required this.apiService});

  //  @override
  // List<Module> get imports => [
  //   AppModule(),
  // ]

  @override
  void binds(Injector i) {
    super.binds(i);

    i.addLazySingleton(() => ApiService());

    i.addLazySingleton<IPokemonRepository>(
      () => PokemonRepository(apiService: i<ApiService>()),
    );
    i.addLazySingleton(() => PokemonService(iPokemonRepository: i()));
    i.add(PokemonStore.new);
    i.add(
      () => HomeController(
        //authController: i<AuthController>(),
        pokemonStore: i<PokemonStore>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child("/", child: (_) => HomePage());
    r.child(
      "/details",
      child: (_) => PokemonDetailPage(pokemonModel: Modular.args.data),
    );
  }
}
