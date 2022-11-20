part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  const PokemonState({
    this.status = BlocStatus.initial,
    this.pokemons = const [],
    this.filteredPokemons = const [],
    this.filterOptions = const ['none', 'height', 'weight'],
    this.selectedOption = 'none',
  });

  final BlocStatus status;
  final List<Pokemon> pokemons;
  final List<Pokemon> filteredPokemons;
  final List<String> filterOptions;
  final String selectedOption;

  PokemonState copyWith({
    BlocStatus? status,
    List<Pokemon>? pokemons,
    List<Pokemon>? filteredPokemons,
    List<String>? filterOptions,
    String? selectedOption,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      filteredPokemons: filteredPokemons ?? this.filteredPokemons,
      filterOptions: filterOptions ?? this.filterOptions,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }

  @override
  List<Object> get props => [status, pokemons, filteredPokemons, filterOptions, selectedOption];
}
