import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/bloc_observer.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon_league/bloc/pokemon_league_bloc.dart';
import 'package:pokedex/pokemon_league_page/bloc/pokemon_league_page_bloc.dart';
import 'package:league_repository/league_repository.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

void main() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBekQCb84uu2RjCTIUB5nS9jMRGwuJJsmc',
      appId: '1:794525172239:web:f62a513a4b5cfb16eb597a',
      messagingSenderId: '794525172239',
      projectId: 'pokemon-app-7f75b',
    ),
  );
  Bloc.observer = PokemonAppBlocObserver();
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => PokemonBloc(
              pokemonRepository: context.read<PokemonRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => PokemonLeagueBloc(
              pokemonLeagueRepository: context.read<PokemonLeagueRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => PokemonLeaguePageBloc(
              pokemonLeagueRepository: context.read<PokemonLeagueRepository>(),
            ),
          )
        ],
        child: App(),
      ),
    );
  }
}
