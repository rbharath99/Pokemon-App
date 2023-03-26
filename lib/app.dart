import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/view/pokemon_details.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

import 'pokemon/view/pokemon_list_view.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: '/',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const PokemonListView();
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'pokemon',
          path: 'pokemon/:name',
          builder: (BuildContext context, GoRouterState state) {
            Pokemon pokemon = state.extra as Pokemon;
            return PokemonDetailsScreen(
              pokemon: pokemon,
              pokemonName: state.params['name']!,
            );
          },
        ),
      ],
    ),
  ],
);

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
    );
  }
}