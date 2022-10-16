import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon.dart';
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
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailsScreen(pokemon: widget.pokemon),
          ),
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
        ],
      ),
    );
  }
}
