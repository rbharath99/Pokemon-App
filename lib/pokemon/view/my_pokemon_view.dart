import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon.dart';
import 'package:pokedex/pokemon/view/pokemon_details.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

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
      body: myPokemonList.isEmpty
          ? Center(
              child: Text(
                'You have no favorite pokemons!',
                style: TextStyle(color: Colors.black),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: _height,
                    width: _width,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: myPokemonList.length,
                      itemBuilder: (context, index) {
                        return OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonDetailsScreen(
                                    pokemon: myPokemonList[index]),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              retrievePokemonType(myPokemonList[index].type[0]),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                myPokemonList[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Image.network(myPokemonList[index].image),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
