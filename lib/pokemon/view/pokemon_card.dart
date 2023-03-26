import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon_repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/view/pokemon_details.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    final List<Pokemon> myPokemonsList =
        context.select((PokemonBloc bloc) => bloc.state.myPokemons);
    final bool isFound = myPokemonsList.contains(widget.pokemon);
    return OutlinedButton(
      onPressed: () {
        context.goNamed(
          'pokemon',
          params: {'name': widget.pokemon.name},
          extra: widget.pokemon,
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          retrievePokemonType(widget.pokemon.type[0]),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Name: ${widget.pokemon.name}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'Height: ${widget.pokemon.height}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'Weigth: ${widget.pokemon.weight}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          Image.network(widget.pokemon.image),
          Spacer(),
          isFound
              ? CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: retrievePokemonType(
                        widget.pokemon.type[0],
                      ),
                    ),
                    onPressed: () => context.read<PokemonBloc>().add(
                          RemovePokemon(
                            pokemon: widget.pokemon,
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
                        widget.pokemon.type[0],
                      ),
                    ),
                    onPressed: () => context.read<PokemonBloc>().add(
                          AddPokemon(
                            pokemon: widget.pokemon,
                          ),
                        ),
                  ),
                ),
        ],
      ),
    );
  }
}
