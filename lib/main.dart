import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/view/pokemon_list_view.dart';
import 'package:pokedex/repository/pokemon_repository.dart';

void main() => runApp(Pokedex());

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

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
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: RepositoryProvider(
          create: (_) => PokemonRepository(),
          child: BlocProvider(
            create: (BuildContext context) => PokemonBloc(
                pokemonRepository: context.read<PokemonRepository>()),
            child: PokemonListView(),
          ),
        ),
      ),
    );
  }
}
