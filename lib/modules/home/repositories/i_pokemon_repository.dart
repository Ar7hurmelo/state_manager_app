import '../../../model/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<List<PokemonModel>> fetchAll();
}
