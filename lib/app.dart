import 'package:flutter/material.dart';

import 'pokemon/view/pokemon_list_view.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Pokedex',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: PokemonListView(),
        bottomNavigationBar: Container(
          height: 56,
          color: Colors.red,
          child: Center(
            child: Text(
              'Gotta Catch ’Em All',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}