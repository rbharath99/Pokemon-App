import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/view/views.dart';
import 'package:pokedex/pokemon_league/bloc/pokemon_league_bloc.dart';
import 'package:pokedex/pokemon_league/view/views.dart';
import 'package:pokedex/pokemon_league_page/view/views.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

class AppRouter {
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
            redirect: (context, state) {
              if (state.location.contains('/pokemon') &&
                  context.read<PokemonBloc>().state.pokemons.isEmpty) {
                return '/';
              }
              return null;
            },
          ),
        ],
      ),
      GoRoute(
        name: 'my-pokemon',
        path: '/my-pokemon',
        builder: (BuildContext context, GoRouterState state) {
          return MyPokemonListView();
        },
      ),
      GoRoute(
        name: 'pokemon-team',
        path: '/pokemon-team',
        builder: (BuildContext context, GoRouterState state) {
          return const PokemonTeam();
        },
      ),
      GoRoute(
        name: 'pokemon-league',
        path: '/pokemon-league',
        builder: (BuildContext context, GoRouterState state) {
          return const PokemonLeague();
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'league',
            path: 'league/:roomID',
            builder: (BuildContext context, GoRouterState state) {
              String leagueName = state.extra as String;
              return PokemonLeaguePage(
                leagueName: leagueName,
                roomId: state.params['roomID']!,
              );
            },
            redirect: (context, state) {
              if (state.location.contains('/league') &&
                  context
                      .read<PokemonLeagueBloc>()
                      .state
                      .pokemonLeagues
                      .isEmpty) {
                return '/pokemon-league';
              }
              return null;
            },
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
