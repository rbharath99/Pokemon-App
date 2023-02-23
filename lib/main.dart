import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/view/pokemon_list_view.dart';
import 'package:pokedex/repository/pokemon_league_repository.dart';
import 'package:pokedex/repository/pokemon_repository.dart';

void main() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBekQCb84uu2RjCTIUB5nS9jMRGwuJJsmc',
      appId: '1:794525172239:web:f62a513a4b5cfb16eb597a',
      messagingSenderId: '794525172239',
      projectId: 'pokemon-app-7f75b',
    ),
  );
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => PokemonRepository(),
        ),
        RepositoryProvider(
          create: (_) => PokemonLeagueRepository(
            fireBaseFireStore: FirebaseFirestore.instance,
          ),
        ),
      ],
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
