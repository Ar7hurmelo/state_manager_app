import '../../../model/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<PokemonModel> getByName(String name);
  Future<PokemonModel> getSpecieById(int id);
  Future<List<PokemonModel>> fetchAll();
}
