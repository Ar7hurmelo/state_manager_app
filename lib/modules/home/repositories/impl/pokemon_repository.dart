import 'package:state_manager_app/config/dio/api_service.dart';
import 'package:state_manager_app/model/pokemon_model.dart';

import '../i_pokemon_repository.dart';

class PokemonRepository implements IPokemonRepository {
  final ApiService apiService;

  PokemonRepository({required this.apiService});

  @override
  Future<List<PokemonModel>> fetchAll() async {
    try {
      final response = await apiService.getRequest(
        '/',
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
