part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  const PokemonState({
    this.status = BlocStatus.initial,
    this.pokemons = const [],
    this.filteredPokemons = const [],
  });

  final BlocStatus status;
  final List<Pokemon> pokemons;
  final List<Pokemon> filteredPokemons;

  PokemonState copyWith({
    BlocStatus? status,
    List<Pokemon>? pokemons,
    List<Pokemon>? filteredPokemons,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      filteredPokemons: filteredPokemons ?? this.filteredPokemons,
    );
  }

  @override
  List<Object> get props => [status, pokemons, filteredPokemons];
}
