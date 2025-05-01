import 'package:flutter/material.dart';

import '../service/pokemon_service.dart';
import 'state/pokemon_state.dart';

class PokemonStore extends ChangeNotifier {
  final PokemonService pokemonService;

  PokemonStore({required this.pokemonService});

  PokemonState pokemonState = PokemonStateFactory.empty();

  Future<void> getPokemons() async {
    pokemonState = PokemonStateFactory.loading();
    notifyListeners();

    try {
      final pokemons = await pokemonService.fetchAll();
      pokemons.sort((a, b) => a.name.compareTo(b.name));
      pokemonState = PokemonStateFactory.getted(pokemons);
    } catch (e) {
      pokemonState = PokemonStateFactory.error(e.toString());
    }

    notifyListeners();
  }
}
