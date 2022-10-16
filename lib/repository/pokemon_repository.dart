import 'dart:convert';

import 'package:pokedex/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  static const baseUrl = 'https://raw.githubusercontent.com/rsr-itminds/flutter-workshop/master/data/pokedex.json';

  Future<List<Pokemon>> fetchPokemonData() async {
    final response = await http.get(Uri.parse(baseUrl));
    print(response.statusCode);

    final List<dynamic> data = jsonDecode(response.body);

    return data.map((json) => Pokemon.fromJson(json)).toList();
  }
}