import '../../../../model/pokemon_model.dart';

sealed class PokemonState {}

class EmptyPokemonState implements PokemonState {}

class LoadingPokemonState implements PokemonState {}

class ErrorPokemonState implements PokemonState {
  final String message;

  ErrorPokemonState({required this.message});
}

class GettedPokemonState implements PokemonState {
  final PokemonModel pokemon;

  GettedPokemonState({required this.pokemon});
}

class GettedPokemonListState implements PokemonState {
  final List<PokemonModel> pokemons;

  GettedPokemonListState({required this.pokemons});
}

class PokemonStateFactory {
  static PokemonState empty() => EmptyPokemonState();

  static PokemonState loading() => LoadingPokemonState();

  static PokemonState error(String message) =>
      ErrorPokemonState(message: message);

  static PokemonState getted(PokemonModel pokemon) =>
      GettedPokemonState(pokemon: pokemon);

  static PokemonState gettedList(List<PokemonModel> pokemons) =>
      GettedPokemonListState(pokemons: pokemons);
}
