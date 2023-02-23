import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/pokemon_league/models/league.dart';
import 'package:pokedex/repository/pokemon_league_repository.dart';
import 'package:pokedex/utils/bloc_status.dart';

part 'pokemon_league_event.dart';
part 'pokemon_league_state.dart';

class PokemonLeagueBloc extends Bloc<PokemonLeagueEvent, PokemonLeagueState> {
  PokemonLeagueBloc({required PokemonLeagueRepository pokemonLeagueRepository})
      : _pokemonLeagueRepository = pokemonLeagueRepository,
        super(const PokemonLeagueState()) {
    on<FetchLeagueInfo>(_onFetchLeagueInfo);
    on<CreateLeague>(_onCreateLeague);
  }

  final PokemonLeagueRepository _pokemonLeagueRepository;

  Future<void> _onFetchLeagueInfo(
      FetchLeagueInfo event, Emitter<PokemonLeagueState> emit) async {}

  Future<void> _onCreateLeague(
      CreateLeague event, Emitter<PokemonLeagueState> emit) async {}
}
