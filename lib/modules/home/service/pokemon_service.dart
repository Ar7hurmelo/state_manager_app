import 'package:state_manager_app/modules/home/repositories/i_pokemon_repository.dart';

import '../../../model/pokemon_model.dart';

class PokemonService {
  final IPokemonRepository iPokemonRepository;

  PokemonService({required this.iPokemonRepository});

  Future<List<PokemonModel>> fetchAll() async {
    try {
      final pokemons = await iPokemonRepository.fetchAll();
      return pokemons;
    } catch (e) {
      throw Exception('Failed to load pokemons: $e');
    }
  }

  // Future<List<PokemonModel>> fetchAll() async {
  //   await Future.delayed(Duration(seconds: 2));

  //   return <PokemonModel>[
  //     PokemonModel(name: 'Buba', url: ''),
  //     PokemonModel(name: 'Pikachu', url: ''),
  //     PokemonModel(name: 'Buba 2', url: ''),
  //     PokemonModel(name: 'Pikachu 2', url: ''),
  //     PokemonModel(name: 'Buba 3', url: ''),
  //     PokemonModel(name: 'Pikachu 3', url: ''),
  //   ];
  // }
}
