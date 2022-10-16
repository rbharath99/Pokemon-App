import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsScreen({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(pokemon.name, style: TextStyle(color: Colors.black)),
        backgroundColor: retrievePokemonType(pokemon.type[0]),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(pokemon.name, style: TextStyle(fontSize: 20,),),
            Image.network(pokemon.image),
            Text('Height: ${pokemon.height}'),
            Text('Weight: ${pokemon.weight}'),
            Text('types:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.type
                  .map(
                    (types) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: FilterChip(
                        pressElevation: 2.0,
                        backgroundColor: retrievePokemonType(types),
                        label: Text(types),
                        onSelected: null,
                      ),
                    ),
                  )
                  .toList(),
            ),
            Text('weaknesses:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.weaknesses
                  .map(
                    (weaknesses) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: FilterChip(
                        pressElevation: 2.0,
                        backgroundColor: retrievePokemonType(weaknesses),
                        label: Text(weaknesses),
                        onSelected: null,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
