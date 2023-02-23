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

    add(FetchLeagueInfo());
  }

  final PokemonLeagueRepository _pokemonLeagueRepository;

  Future<void> _onFetchLeagueInfo(
    FetchLeagueInfo event,
    Emitter<PokemonLeagueState> emit,
  ) async {
    emit(
      state.copyWith(
        status: BlocStatus.loading,
      ),
    );
    final pokemonLeagues = await _pokemonLeagueRepository.fetchLeagues();
    emit(
      state.copyWith(
        pokemonLeagues: pokemonLeagues,
        status: BlocStatus.success,
      ),
    );
  }

  Future<void> _onCreateLeague(
    CreateLeague event,
    Emitter<PokemonLeagueState> emit,
  ) async {
    final name = event.name;
    final participants = int.parse(event.participants);
    final entryFee = int.parse(event.entryFee);
    final prizeFee = int.parse(event.prizeFee);
    final league = League(
      name: name,
      participants: participants,
      entryFee: entryFee,
      prizeFee: prizeFee,
      roomId: '1',
    );
    await _pokemonLeagueRepository.createLeague(league);
  }
}
