import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_grid_item.dart';

class HomeScreen extends StatelessWidget {
  final List<Pokemon>? pokemons;

  const HomeScreen({Key? key, this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Map the list of Pokémons to a list of Text widgets
    List<Widget> list = pokemons!.map((p) => PokemonGridItem(pokemon: p)).toList();

    // Show the Text widgets in a Column widget
    return GridView.count(crossAxisCount: 4, children: list);
  }
}