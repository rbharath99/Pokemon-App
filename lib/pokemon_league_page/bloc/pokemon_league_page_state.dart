part of 'pokemon_league_page_bloc.dart';

class PokemonLeaguePageState extends Equatable {
  const PokemonLeaguePageState({
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

  PokemonLeaguePageState copyWith({
    BlocStatus? status,
    League? pokemonLeague,
    List<League>? pokemonLeagues,
    List<League>? pokemonFilterLeagues,
    List<Map<String, List<String>>>? pokemonRosters,
  }) {
    return PokemonLeaguePageState(
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
