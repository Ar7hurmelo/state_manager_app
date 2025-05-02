import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:state_manager_app/model/pokemon_model.dart';

import '../../controllers/home_controller.dart';
import '../../store/state/pokemon_state.dart';

class PokemonDetailPage extends StatefulWidget {
  final PokemonModel pokemonModel;

  const PokemonDetailPage({super.key, required this.pokemonModel});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late PokemonModel pokemonModel;
  final HomeController homeController = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    pokemonModel = widget.pokemonModel;
    homeController.pokemonStore.getSpecieById(pokemonModel.idByUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemonModel.name ?? 'Não Encontrado')),
      body: ListenableBuilder(
        listenable: homeController.pokemonStore,
        builder: (context, child) {
          Widget bodyWidget = Container();
          var pokemonState = homeController.pokemonStore.pokemonState;

          if (pokemonState is LoadingPokemonState) {
            bodyWidget = const Center(child: CircularProgressIndicator());
          } else if (pokemonState is ErrorPokemonState) {
            bodyWidget = Center(
              child: Text('Erro: $homeController.pokemonStore.error'),
            );
          } else if (pokemonState is EmptyPokemonState) {
            bodyWidget = Center(child: Text('Nenhum pokemon foi encontrado!'));
          } else if (pokemonState is GettedPokemonState) {
            bodyWidget = Center(
              child: Text(
                '${pokemonState.pokemon.name} - ${pokemonState.pokemon.flavorTextEntries?.first.flavorText}',
              ),
            );
          }

          return bodyWidget;
        },
      ),
    );
  }
}
