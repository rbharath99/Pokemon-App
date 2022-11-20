part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object?> get props => [];
}

class FetchPokemonData extends PokemonEvent {}

class SearchPokemon extends PokemonEvent {
  final String searchedName;

  const SearchPokemon({required this.searchedName});

  @override
  List<Object?> get props => [searchedName];
}
