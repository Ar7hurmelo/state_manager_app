import 'package:flutter/material.dart';

import '../service/pokemon_service.dart';
import 'state/pokemon_state.dart';

class PokemonStore extends ChangeNotifier {
  final PokemonService pokemonService;
  late PokemonState pokemonState;

  PokemonStore({required this.pokemonService}) {
    pokemonState = PokemonStateFactory.empty();
  }

  Future<void> getByName(String name) async {
    pokemonState = PokemonStateFactory.loading();
    notifyListeners();

    try {
      final pokemon = await pokemonService.getByName(name);
      pokemonState = PokemonStateFactory.getted(pokemon);
    } catch (e) {
      pokemonState = PokemonStateFactory.error(e.toString());
    }

    notifyListeners();
  }

  Future<void> getSpecieById(int id) async {
    pokemonState = PokemonStateFactory.loading();
    notifyListeners();

    try {
      final pokemon = await pokemonService.getSpecieById(id);
      pokemonState = PokemonStateFactory.getted(pokemon);
    } catch (e) {
      pokemonState = PokemonStateFactory.error(e.toString());
    }

    notifyListeners();
  }

  Future<void> getPokemons() async {
    pokemonState = PokemonStateFactory.loading();
    notifyListeners();

    try {
      final pokemons = await pokemonService.fetchAll();
      pokemons.sort((a, b) => a.name!.compareTo(b.name!));

      pokemonState = PokemonStateFactory.gettedList(pokemons);
    } catch (e) {
      pokemonState = PokemonStateFactory.error(e.toString());
    }

    notifyListeners();
  }
}
