import 'package:state_manager_app/config/dio/api_service.dart';
import 'package:state_manager_app/model/pokemon_model.dart';

import '../i_pokemon_repository.dart';

class PokemonRepository implements IPokemonRepository {
  final ApiService apiService;

  PokemonRepository({required this.apiService});

  @override
  Future<PokemonModel> getByName(String name) async {
    try {
      final response = await apiService.getRequest('/pokemon/$name');
      if (response.statusCode == 200) {
        return PokemonModel.fromMap(response.data);
      } else {
        throw Exception('Failed to load pokemon');
      }
    } catch (e) {
      throw Exception('Failed to load pokemon: $e');
    }
  }

  @override
  Future<PokemonModel> getSpecieById(int id) async {
    try {
      final response = await apiService.getRequest('/pokemon-species/$id');
      if (response.statusCode == 200) {
        return PokemonModel.fromMap(response.data);
      } else {
        throw Exception('Failed to load pokemon');
      }
    } catch (e) {
      throw Exception('Failed to load pokemon: $e');
    }
  }

  @override
  Future<List<PokemonModel>> fetchAll() async {
    try {
      final response = await apiService.getRequest(
        '/pokemon/',
        queryParameters: {'limit': 20, 'offset': 20},
      );
      if (response.statusCode == 200) {
        final data = response.data['results'] as List;
        return data.map((e) => PokemonModel.fromMap(e)).toList();
      } else {
        throw Exception('Failed to load pokemons');
      }
    } catch (e) {
      throw Exception('Failed to load pokemons: $e');
    }
  }
}
