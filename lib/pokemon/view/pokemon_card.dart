import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/models/pokemon.dart';
import 'package:pokedex/pokemon/view/pokemon_details.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailsScreen(pokemon: pokemon),
          ),
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
                'Weigth: ${pokemon.weight}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          Image.network(pokemon.image),
          Spacer(),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                context.read<PokemonBloc>().add(AddPokemon(pokemon: pokemon)),
          ),
        ],
      ),
    );
  }
}
