import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/home_page.dart';

void main() => runApp(Pokedex());

class Pokedex extends StatelessWidget {
  // Client is used for HTTP requests
  final client = Client();

  Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Pokedex', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: buildPokemonScreen(),
      ),
    );
  }

  Widget buildPokemonScreen() {
    // FutureBuilder is a Flutter widget used to build layouts with async data, like data fetched from an API.
    return FutureBuilder(
      future: fetchPokemonsFromAPI(),

      // The snapshot contains the list of Pokémons
      builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
        if (snapshot.hasData) {
          return HomeScreen(pokemons: snapshot.data);
        } else {
          // Show a loading spinner
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<List<Pokemon>> fetchPokemonsFromAPI() async {
    final response = await client.get(Uri.parse('https://raw.githubusercontent.com/rsr-itminds/flutter-workshop/master/data/pokedex.json'));

    // Get the JSON data from the response
    final List<dynamic> data = json.decode(response.body);

    // Convert JSON to Pokemons by using the named constructor fromJson
    return data.map((json) => Pokemon.fromJson(json)).toList();
  }
}