part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  const PokemonState({
    this.status = BlocStatus.initial,
    this.pokemons = const [],
    this.myPokemons = const [],
    this.filteredPokemons = const [],
    this.pokemonRoster = const [],
    this.filterOptions = const ['none', 'height', 'weight'],
    this.selectedOption = 'none',
    this.pokemon = Pokemon.empty,
  });

  final BlocStatus status;
  final List<Pokemon> pokemons;
  final List<Pokemon> myPokemons;
  final List<Pokemon> filteredPokemons;
  final List<Pokemon> pokemonRoster;
  final List<String> filterOptions;
  final String selectedOption;
  final Pokemon pokemon;

  PokemonState copyWith({
    BlocStatus? status,
    List<Pokemon>? pokemons,
    List<Pokemon>? myPokemons,
    List<Pokemon>? filteredPokemons,
    List<Pokemon>? pokemonRoster,
    List<String>? filterOptions,
    String? selectedOption,
    Pokemon? pokemon,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      myPokemons: myPokemons ?? this.myPokemons,
      filteredPokemons: filteredPokemons ?? this.filteredPokemons,
      filterOptions: filterOptions ?? this.filterOptions,
      pokemonRoster: pokemonRoster ?? this.pokemonRoster,
      selectedOption: selectedOption ?? this.selectedOption,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  @override
  List<Object> get props => [
        status,
        pokemons,
        myPokemons,
        filteredPokemons,
        filterOptions,
        pokemonRoster,
        selectedOption,
        pokemon,
      ];
}
