import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/models/pokemon.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/utils/bloc_status.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({
    required PokemonRepository pokemonRepository,
  })  : _pokemonRepository = pokemonRepository,
        super(const PokemonState()) {
    on<FetchPokemonData>(_fetchPokemonData);
    on<SearchPokemon>(_searchPokemon);
    on<FilterPokemon>(_filterPokemon);
  }

  final PokemonRepository _pokemonRepository;

  Future<void> _fetchPokemonData(
      FetchPokemonData event, Emitter<PokemonState> emit) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      final pokemonList = await _pokemonRepository.fetchPokemonData();
      emit(state.copyWith(
          status: BlocStatus.loaded,
          pokemons: pokemonList,
          filteredPokemons: pokemonList));
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.error));
    }
  }

  void _searchPokemon(SearchPokemon event, Emitter<PokemonState> emit) {
    final parsedInput = event.searchedName.trim().toLowerCase();
    emit(state.copyWith(
      filteredPokemons: state.pokemons
          .where((pokemon) => pokemon.name.toLowerCase().contains(parsedInput))
          .toList(),
      status: BlocStatus.success,
    ));
  }

  Future<void> _filterPokemon(FilterPokemon event, Emitter<PokemonState> emit) async {
    final option = event.filterOption;
    switch(option) {
      case 'none':
        final pokemonList = await _pokemonRepository.fetchPokemonData();
        emit(state.copyWith(filteredPokemons: pokemonList, status: BlocStatus.success));
        break;
      case 'height':
        state.pokemons.sort((b, a) => a.height.compareTo(b.height));
        emit(state.copyWith(filteredPokemons: state.pokemons, status: BlocStatus.success));
        break;
      case 'weight':
        state.pokemons.sort((b, a) => a.weight.compareTo(b.weight));
        emit(state.copyWith(filteredPokemons: state.pokemons, status: BlocStatus.success));
        break;
    }
  }
}
