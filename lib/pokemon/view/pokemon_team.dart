import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/dialog/pokemon_selection.dart';
import 'package:pokedex/pokemon/models/pokemon.dart';
import 'package:pokedex/utils/bloc_status.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class PokemonTeam extends StatelessWidget {
  const PokemonTeam({Key? key, required this.myPokemonList}) : super(key: key);

  final List<Pokemon> myPokemonList;

  @override
  Widget build(BuildContext context) {
    final state = context.select((PokemonBloc bloc) => bloc.state.status);
    final pokemon = context.select((PokemonBloc bloc) => bloc.state.pokemon);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Build a Team',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          color: Colors.red,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              if (state == BlocStatus.addedToTeam) {
                return OutlinedButton(
                  onPressed: () => {
                    showDialog(
                      context: context,
                      builder: (context) => PokemonSelection(),
                    )
                  },
                  child: SizedBox(
                    width: 500,
                    height: 100,
                    child: ColoredBox(
                      color: retrievePokemonType(pokemon.type[0])!,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(pokemon.image),
                          Text(
                            pokemon.name,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return OutlinedButton(
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (context) => PokemonSelection(),
                  )
                },
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text(
                    'Select a Pokemon',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
