import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_league_event.dart';
part 'pokemon_league_state.dart';

class PokemonLeagueBloc extends Bloc<PokemonLeagueEvent, PokemonLeagueState> {
  PokemonLeagueBloc() : super(PokemonLeagueInitial()) {
    on<FetchLeagueInfo>(_onFetchLeagueInfo);
    on<CreateLeague>(_onCreateLeague);
  }

  Future<void> _onFetchLeagueInfo(
      FetchLeagueInfo event, Emitter<PokemonLeagueState> emit) async {}

  Future<void> _onCreateLeague(
      CreateLeague event, Emitter<PokemonLeagueState> emit) async {}
}
