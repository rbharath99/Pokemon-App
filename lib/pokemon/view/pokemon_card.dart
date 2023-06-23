import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon_repository/pokemon_repository.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> myPokemonsList =
        context.select((PokemonBloc bloc) => bloc.state.myPokemons);
    final bool isFound = myPokemonsList.contains(pokemon);
    return OutlinedButton(
      onPressed: () {
        context.pushNamed(
          'pokemon',
          params: {'name': pokemon.name},
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          retrievePokemonType(pokemon.type[0]),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Name: ${pokemon.name}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'Height: ${pokemon.height}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'Weight: ${pokemon.weight}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          Image.network(pokemon.image),
          Spacer(),
          isFound
              ? CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: retrievePokemonType(
                        pokemon.type[0],
                      ),
                    ),
                    onPressed: () => context.read<PokemonBloc>().add(
                          RemovePokemon(
                            pokemon: pokemon,
                          ),
                        ),
                  ),
                )
              : CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: retrievePokemonType(
                        pokemon.type[0],
                      ),
                    ),
                    onPressed: () => context.read<PokemonBloc>().add(
                          AddPokemon(
                            pokemon: pokemon,
                          ),
                        ),
                  ),
                ),
        ],
      ),
    );
  }
}
