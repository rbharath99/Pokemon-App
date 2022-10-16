import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/pokemon_card.dart';
import 'package:pokedex/pages/pokemon_error.dart';
import 'package:pokedex/pages/loading_bar.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/utils/bloc_status.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({Key? key}) : super(key: key);

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final bloc = context.read<PokemonBloc>();
        final pokemonList = state.pokemons;
        final pokemonFilteredList = state.filteredPokemons;
        if (state.status == BlocStatus.loading ||
            state.status == BlocStatus.initial) {
          return LoadingBar();
        }
        if (state.status == BlocStatus.error) {
          return PokemonError();
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: pokemonFilteredList.length,
          itemBuilder: (context, index) {
            return PokemonCard(pokemon: pokemonFilteredList[index]);
          },
        );
      },
    );
  }
}
