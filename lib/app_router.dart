import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/view/views.dart';
import 'package:pokedex/pokemon_league/bloc/pokemon_league_bloc.dart';
import 'package:pokedex/pokemon_league/view/views.dart';
import 'package:pokedex/pokemon_league_page/view/views.dart';
import 'package:pokedex/utils/status_widgets/loading_bar.dart';

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
              final name = state.params['name']!;
              final pokemons = context.watch<PokemonBloc>().state.pokemons;
              if (pokemons.isEmpty) {
                return LoadingBar();
              }
              final pokemon =
                  pokemons.firstWhere((pokemon) => pokemon.name == name);
              return PokemonDetailsScreen(
                pokemon: pokemon,
                pokemonName: name,
              );
            },
          ),
          GoRoute(
            name: 'pokemon-league',
            path: 'pokemon-league',
            builder: (BuildContext context, GoRouterState state) {
              return const PokemonLeague();
            },
            routes: <RouteBase>[
              GoRoute(
                name: 'league',
                path: 'league/:roomID',
                builder: (BuildContext context, GoRouterState state) {
                  final roomID = state.params['roomID']!;
                  final pokemonLeagues =
                      context.watch<PokemonLeagueBloc>().state.pokemonLeagues;
                  if (pokemonLeagues.isEmpty) {
                    return LoadingBar();
                  }
                  final pokemonLeague = pokemonLeagues.firstWhere(
                      (pokemonLeague) => pokemonLeague.roomId == roomID);
                  return PokemonLeaguePage(
                    league: pokemonLeague,
                    roomId: roomID,
                  );
                },
              ),
            ],
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
    ],
  );

  GoRouter get router => _router;
}
