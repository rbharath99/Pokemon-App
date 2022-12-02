import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon.dart';
import 'package:pokedex/pokemon/view/pokemon_card.dart';

class MyPokemonListView extends StatelessWidget {
  const MyPokemonListView({Key? key, required this.myPokemonList})
      : super(key: key);

  final List<Pokemon> myPokemonList;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'My Pokemons',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: _height,
              width: _width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: myPokemonList.length,
                itemBuilder: (context, index) {
                  return PokemonCard(pokemon: myPokemonList[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
