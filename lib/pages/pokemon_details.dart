import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class DetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsScreen({Key? key, required this.pokemon}) : super(key: key);

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
            Container(
              width: 300,
              height: 300,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                shape: BoxShape.rectangle,
                color: retrievePokemonType(pokemon.type[0]),
              ),
              child: Image.network(pokemon.image,),
            ),
            Text(pokemon.name),
            Text('Height: ${pokemon.height}'),
            Text('Weight: ${pokemon.weight}'),
            Text(
              'Types',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.type
                .map((types) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                    child: FilterChip(
                        pressElevation: 2.0,
                        backgroundColor: retrievePokemonType(types),
                        label: Text(types),
                        onSelected: (_) {})))
                .toList(),
            ),
            SizedBox(height: 6.0,),
            Text(
              'Weaknesses',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.weaknesses
                .map((weakness) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                    child: FilterChip(
                        pressElevation: 2.0,
                        backgroundColor: retrievePokemonType(weakness),
                        label: Text(weakness),
                        onSelected: (_) {})))
                .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

