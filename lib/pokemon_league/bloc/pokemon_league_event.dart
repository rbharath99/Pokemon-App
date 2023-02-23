part of 'pokemon_league_bloc.dart';

abstract class PokemonLeagueEvent extends Equatable {
  const PokemonLeagueEvent();

  @override
  List<Object?> get props => [];
}

class FetchLeagueInfo extends PokemonLeagueEvent {}

class CreateLeague extends PokemonLeagueEvent {
  final String name;
  final int participants;
  final int entryFee;
  final int prizeFee;

  const CreateLeague({
    required this.name,
    required this.participants,
    required this.entryFee,
    required this.prizeFee,
  });

  @override
  List<Object?> get props => [name, participants, entryFee, prizeFee];
}
