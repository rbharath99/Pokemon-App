import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/pokemon_details.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class PokemonGridItem extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonGridItem({Key? key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: ((context) => DetailsScreen(pokemon: pokemon!))));
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 400,
            height: 400,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              shape: BoxShape.rectangle,
              color: retrievePokemonType(pokemon!.type[0]),
            ),
            child: Image.network(pokemon!.image,),
          ),
          Text(
            pokemon!.name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            pokemon!.number,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}