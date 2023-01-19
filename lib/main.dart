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
    return RepositoryProvider(
      create: (_) => PokemonRepository(),
      child: BlocProvider(
        create: (BuildContext context) => PokemonBloc(
          pokemonRepository: context.read<PokemonRepository>(),
        ),
        child: MaterialApp(
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
        ),
      ),
    );
  }
}
