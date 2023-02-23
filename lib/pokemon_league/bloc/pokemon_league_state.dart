part of 'pokemon_league_bloc.dart';

class PokemonLeagueState extends Equatable {
  const PokemonLeagueState({
    this.status = BlocStatus.initial,
    this.pokemonLeague = League.empty,
    this.pokemonLeagues = const [],
  });

  final BlocStatus status;
  final League pokemonLeague;
  final List<League> pokemonLeagues;

  PokemonLeagueState copyWith({
    BlocStatus? status,
    League? pokemonLeague,
    List<League>? pokemonLeagues,
  }) {
    return PokemonLeagueState(
      status: status ?? this.status,
      pokemonLeague: pokemonLeague ?? this.pokemonLeague,
      pokemonLeagues: pokemonLeagues ?? this.pokemonLeagues,
    );
  }

  @override
  List<Object> get props => [
        status,
        pokemonLeague,
        pokemonLeagues,
      ];
}
