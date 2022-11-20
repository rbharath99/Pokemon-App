import 'dart:convert';

import 'package:pokedex/pokemon/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  static const baseUrl =
      'https://raw.githubusercontent.com/rsr-itminds/flutter-workshop/master/data/pokedex.json';

  Future<List<Pokemon>> fetchPokemonData() async {
    final response = await http.get(Uri.parse(baseUrl));

    final List<dynamic> data = jsonDecode(response.body);

    final List<Pokemon> pokemons =
        data.map((item) => Pokemon.fromJson(item)).toList();

    return pokemons;
  }
}
