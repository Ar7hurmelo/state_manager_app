import 'package:state_manager_app/modules/home/repositories/i_pokemon_repository.dart';

import '../../../model/pokemon_model.dart';

class PokemonService {
  final IPokemonRepository iPokemonRepository;

  PokemonService({required this.iPokemonRepository});

  Future<PokemonModel> getByName(String name) async {
    try {
      final pokemon = await iPokemonRepository.getByName(name);
      return pokemon;
    } catch (e) {
      throw Exception('Failed to load pokemon details: $e');
    }
  }

  Future<PokemonModel> getSpecieById(int id) async {
    try {
      final pokemon = await iPokemonRepository.getSpecieById(id);
      return pokemon;
    } catch (e) {
      throw Exception('Failed to load pokemon details: $e');
    }
  }

  Future<List<PokemonModel>> fetchAll() async {
    try {
      final pokemons = await iPokemonRepository.fetchAll();
      return pokemons;
    } catch (e) {
      throw Exception('Failed to load pokemons: $e');
    }
  }
}
