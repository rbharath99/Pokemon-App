import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(pokemon.name, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // pokemonImageContainer(),
            Text(pokemon.name),
            Text('Height: ${pokemon.height}'),
            Text('Weight: ${pokemon.weight}'),
          ],
        ),
      ),
    );
  }
}
