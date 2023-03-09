import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/pokemon_league/models/league.dart';
import 'package:pokedex/repository/pokemon_league_repository.dart';
import 'package:pokedex/utils/bloc_status.dart';

part 'pokemon_league_page_event.dart';
part 'pokemon_league_page_state.dart';

class PokemonLeaguePageBloc
    extends Bloc<PokemonLeaguePageEvent, PokemonLeaguePageState> {
  PokemonLeaguePageBloc(
      {required PokemonLeagueRepository pokemonLeagueRepository})
      : _pokemonLeagueRepository = pokemonLeagueRepository,
        super(const PokemonLeaguePageState()) {
    on<FetchLeagueRoster>(_onFetchLeagueRosterEvent);
  }

  final PokemonLeagueRepository _pokemonLeagueRepository;

  Future<void> _onFetchLeagueRosterEvent(
      FetchLeagueRoster event, Emitter<PokemonLeaguePageState> emit) async {
    final roomId = event.roomId;
    await emit.onEach<List<Map<String, List<String>>>>(
      _pokemonLeagueRepository.getRosters(roomId),
      onData: (rosters) => emit(
        state.copyWith(
          pokemonRosters: rosters,
        ),
      ),
    );
  }
}
