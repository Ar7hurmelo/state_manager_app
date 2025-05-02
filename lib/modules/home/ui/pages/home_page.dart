import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:state_manager_app/modules/home/store/state/pokemon_state.dart';

import '../../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Modular.get<HomeController>();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    homeController.pokemonStore.getPokemons();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // if (!_loading.value) {
      //   _loading.value = true;
      //   _bloc.fetchMore(_page).then((value) {
      //     _page += 1;
      //     _loading.value = false;
      //   });
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons List'),
        actions: [
          IconButton(
            onPressed: homeController.pokemonStore.getPokemons,
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () => Modular.to.pushNamed("/free/"),
            icon: const Icon(Icons.arrow_drop_up),
          ),
          IconButton(
            onPressed: homeController.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
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
            bodyWidget = Center(child: Text('Nenhum pokemon foi encontrado'));
          } else if (pokemonState is GettedPokemonListState) {
            bodyWidget = Column(
              children: [
                //_valueNotifier(),
                Expanded(
                  child: GridView.builder(
                    //controller: _scrollController,
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 16,
                      top: 20,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      var pokemon = pokemonState.pokemons[index];
                      return GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed(
                            "/home/details",
                            arguments: pokemon,
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 12,

                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(14),
                                  child: Image.network(
                                    'https://img.pokemondb.net/artwork/${pokemon.name}.jpg',
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error, size: 50);
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: double.infinity,
                                color: Colors.grey[200],
                                child: Center(
                                  child: Text(
                                    pokemon.name!,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: pokemonState.pokemons.length,
                  ),
                ),
                SafeArea(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    // height: _loading.value ? 40 : 0,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Loading more...',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return bodyWidget;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Modular.to.pushNamed('/counter/${homeController.user}'),
        child: const Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
