import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class MyPokemonListView extends StatelessWidget {
  const MyPokemonListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final myPokemonList = context.select((PokemonBloc bloc) => bloc.state.myPokemons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'My Pokemons',
          style: TextStyle(
            color: Colors.white,
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
                            context.pushNamed('mypokemon',
                                params: {'name': myPokemonList[index].name});
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
