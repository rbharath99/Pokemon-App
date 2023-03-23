import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon_repository/pokemon_repository.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class PokemonSelection extends StatelessWidget {
  const PokemonSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> myPokemonList =
        context.select((PokemonBloc bloc) => bloc.state.myPokemons);
    return Dialog(
      child: SizedBox(
        height: 500,
        width: 200,
        child: myPokemonList.isEmpty
            ? Center(
                child: Text(
                  'You have no favorite pokemons!',
                  style: TextStyle(color: Colors.black),
                ),
              )
            : ListView.builder(
                itemCount: myPokemonList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 250,
                    width: 100,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          retrievePokemonType(
                            myPokemonList[index].type[0],
                          ),
                        ),
                      ),
                      onPressed: () => {
                        context.read<PokemonBloc>().add(
                              SetPokemon(
                                pokemon: myPokemonList[index],
                              ),
                            ),
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(myPokemonList[index].image),
                          Text(
                            myPokemonList[index].name,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
