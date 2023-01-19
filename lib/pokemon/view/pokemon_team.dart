import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/dialog/pokemon_selection.dart';
import 'package:pokedex/pokemon/models/pokemon.dart';

class PokemonTeam extends StatelessWidget {
  const PokemonTeam({Key? key, required this.myPokemonList}) : super(key: key);

  final List<Pokemon> myPokemonList;

  @override
  Widget build(BuildContext context) {
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
