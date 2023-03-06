import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/pokemon_league/models/league.dart';
import 'package:pokedex/repository/pokemon_league_repository.dart';
import 'package:pokedex/utils/bloc_status.dart';
import 'dart:math';

part 'pokemon_league_event.dart';
part 'pokemon_league_state.dart';

class PokemonLeagueBloc extends Bloc<PokemonLeagueEvent, PokemonLeagueState> {
  PokemonLeagueBloc({required PokemonLeagueRepository pokemonLeagueRepository})
      : _pokemonLeagueRepository = pokemonLeagueRepository,
        super(const PokemonLeagueState()) {
    on<FetchLeagueInfo>(_onFetchLeagueInfo);
    on<CreateLeague>(_onCreateLeague);
    on<SearchLeague>(_onSearchLeague);
    on<AddRosterToLeague>(_onAddRosterToLeague);

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
        pokemonFilterLeagues: pokemonLeagues,
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
    final roomId = generateRandomId(10);
    final league = League(
      name: name,
      participants: participants,
      entryFee: entryFee,
      prizeFee: prizeFee,
      roomId: roomId,
      teamRoster: [],
    );
    await _pokemonLeagueRepository.createLeague(league);
    add(FetchLeagueInfo());
  }

  Future<void> _onSearchLeague(
      SearchLeague event, Emitter<PokemonLeagueState> emit) async {
    final input = event.input.trim().toLowerCase();
    emit(
      state.copyWith(
        pokemonFilterLeagues: state.pokemonLeagues
            .where(
              (league) => league.name.toLowerCase().contains(
                    input.toLowerCase(),
                  ),
            )
            .toList(),
        status: BlocStatus.success,
      ),
    );
  }

  Future<void> _onAddRosterToLeague(
      AddRosterToLeague event, Emitter<PokemonLeagueState> emit) async {
    final pokemonNames = event.pokemonNames;
    final teamRosters = event.teamRosters;
    final roomId = event.roomId;
    final payload = {generateRandomId(5): pokemonNames};
    List<Map<String, List<String>>> pokemonRosters = List.from(teamRosters)
      ..add(payload);
    await _pokemonLeagueRepository.addRoster(pokemonRosters, roomId);
    emit(state.copyWith(pokemonRosters: pokemonRosters));
  }

  String generateRandomId(int length) {
    const predefinedCharacters =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final random = Random();
    final generatedRoomId = String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => predefinedCharacters.codeUnitAt(
          random.nextInt(
            predefinedCharacters.length,
          ),
        ),
      ),
    );
    return generatedRoomId;
  }
}
