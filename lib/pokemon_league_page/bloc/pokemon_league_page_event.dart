part of 'pokemon_league_page_bloc.dart';

abstract class PokemonLeaguePageEvent extends Equatable {
  const PokemonLeaguePageEvent();

  @override
  List<Object?> get props => [];
}

class FetchLeagueRoster extends PokemonLeaguePageEvent {
  const FetchLeagueRoster({required this.roomId});

  final String roomId;

  @override
  List<Object?> get props => [roomId];
}
