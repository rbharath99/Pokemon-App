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

class FilterPokemon extends PokemonEvent {
  final String filterOption;

  const FilterPokemon({required this.filterOption});

  @override
  List<Object?> get props => [filterOption];
}

class AddPokemon extends PokemonEvent {
  final Pokemon pokemon;

  const AddPokemon({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}

class RemovePokemon extends PokemonEvent {
  final Pokemon pokemon;

  const RemovePokemon({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}

class SetPokemon extends PokemonEvent {
  final Pokemon pokemon;

  const SetPokemon({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}

class ClearPokemonRoster extends PokemonEvent {
  const ClearPokemonRoster();
}

class RemovePokemonFromRoster extends PokemonEvent {
  final Pokemon pokemon;

  const RemovePokemonFromRoster({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}

class UploadPokemon extends PokemonEvent {
  final String number;
  final String name;
  final String image;
  final String height;
  final String weight;
  final String type;
  final String weaknesses;

  const UploadPokemon({
    required this.number,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.type,
    required this.weaknesses,
  });

  @override
  List<Object?> get props =>
      [number, name, image, height, weight, type, weaknesses];
}
