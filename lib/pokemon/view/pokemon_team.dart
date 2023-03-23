import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/dialog/pokemon_selection.dart';
import 'package:pokemon_repository/pokemon_repository.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class PokemonTeam extends StatelessWidget {
  const PokemonTeam({Key? key, required this.myPokemonList}) : super(key: key);

  final List<Pokemon> myPokemonList;

  @override
  Widget build(BuildContext context) {
    final pokemonRoster =
        context.select((PokemonBloc bloc) => bloc.state.pokemonRoster);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Build a Team',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 500,
              color: Colors.red,
              child: ListView.builder(
                itemCount: pokemonRoster.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 500,
                    height: 100,
                    child: Container(
                      color: retrievePokemonType(pokemonRoster[index].type[0])!,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(pokemonRoster[index].image),
                          Text(
                            pokemonRoster[index].name,
                            style: TextStyle(color: Colors.black),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () => {
                                context.read<PokemonBloc>().add(
                                      RemovePokemonFromRoster(
                                        pokemon: pokemonRoster[index],
                                      ),
                                    )
                              },
                              icon: Icon(
                                Icons.remove,
                                color: retrievePokemonType(
                                  pokemonRoster[index].type[0],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.red,
                  onPressed: () => {
                    showDialog(
                      context: context,
                      builder: (context) => PokemonSelection(),
                    )
                  },
                  icon: Icon(Icons.add),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () => {
                    context.read<PokemonBloc>().add(
                          ClearPokemonRoster(),
                        ),
                  },
                  child: Text(
                    'Clear Selection',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
