import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon.dart';
import 'package:pokedex/pokemon/view/pokemon_details.dart';

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
        Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonDetailsScreen(pokemon: widget.pokemon),));
      },
      child: Row(
        children: [
          Text(widget.pokemon.name),
          Text(widget.pokemon.height),
          Text(widget.pokemon.weight),
        ],
      ),
    );
  }
}