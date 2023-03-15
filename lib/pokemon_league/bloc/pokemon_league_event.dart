part of 'pokemon_league_bloc.dart';

abstract class PokemonLeagueEvent extends Equatable {
  const PokemonLeagueEvent();

  @override
  List<Object?> get props => [];
}

class FetchLeagueInfo extends PokemonLeagueEvent {}

class CreateLeague extends PokemonLeagueEvent {
  final String name;
  final String participants;
  final String entryFee;
  final String prizeFee;

  const CreateLeague({
    required this.name,
    required this.participants,
    required this.entryFee,
    required this.prizeFee,
  });

  @override
  List<Object?> get props => [name, participants, entryFee, prizeFee];
}

class SearchLeague extends PokemonLeagueEvent {
  final String input;

  const SearchLeague({
    required this.input,
  });

  @override
  List<Object?> get props => [input];
}

class AddRosterToLeague extends PokemonLeagueEvent {
  final List<String> pokemonNames;
  final List<Map<String, List<String>>> teamRosters;
  final String roomId;

  const AddRosterToLeague({
    required this.pokemonNames,
    required this.teamRosters,
    required this.roomId,
  });

  @override
  List<Object?> get props => [pokemonNames, teamRosters, roomId];
}

class DeleteLeague extends PokemonLeagueEvent {
  final String roomId;

  const DeleteLeague({
    required this.roomId,
  });

  @override
  List<Object?> get props => [roomId];
}
