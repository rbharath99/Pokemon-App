part of 'pokemon_league_bloc.dart';

class PokemonLeagueState extends Equatable {
  const PokemonLeagueState({
    this.status = BlocStatus.initial,
    this.pokemonLeague = League.empty,
    this.pokemonLeagues = const [],
    this.pokemonFilterLeagues = const [],
    this.pokemonRosters = const [],
  });

  final BlocStatus status;
  final League pokemonLeague;
  final List<League> pokemonLeagues;
  final List<League> pokemonFilterLeagues;
  final List<Map<String, List<String>>> pokemonRosters;

  PokemonLeagueState copyWith({
    BlocStatus? status,
    League? pokemonLeague,
    List<League>? pokemonLeagues,
    List<League>? pokemonFilterLeagues,
    List<Map<String, List<String>>>? pokemonRosters,
  }) {
    return PokemonLeagueState(
      status: status ?? this.status,
      pokemonLeague: pokemonLeague ?? this.pokemonLeague,
      pokemonLeagues: pokemonLeagues ?? this.pokemonLeagues,
      pokemonFilterLeagues: pokemonFilterLeagues ?? this.pokemonFilterLeagues,
      pokemonRosters: pokemonRosters ?? this.pokemonRosters,
    );
  }

  @override
  List<Object> get props => [
        status,
        pokemonLeague,
        pokemonLeagues,
        pokemonFilterLeagues,
        pokemonRosters,
      ];
}
