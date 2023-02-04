import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/dialog/fill_pokemon_details.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class UploadPokemonView extends StatelessWidget {
  const UploadPokemonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newPokemons =
        context.select((PokemonBloc bloc) => bloc.state.newPokemons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Upload Pokemon',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 500,
              color: Colors.red,
              child: ListView.builder(
                itemCount: newPokemons.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 500,
                    height: 100,
                    child: Container(
                      color: retrievePokemonType(newPokemons[index].type[0])!,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(newPokemons[index].image),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Name: ${newPokemons[index].name}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Height: ${newPokemons[index].height}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Weigth: ${newPokemons[index].weight}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.red,
                  onPressed: () => {
                    showDialog(
                      context: context,
                      builder: (context) => FillPokemonDetails(),
                    )
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
