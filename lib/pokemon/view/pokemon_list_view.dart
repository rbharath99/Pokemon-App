import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/view/pokemon_card.dart';
import 'package:pokedex/utils/status_widgets/pokemon_error.dart';
import 'package:pokedex/utils/status_widgets/loading_bar.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/utils/bloc_status.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({Key? key}) : super(key: key);

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  late TextEditingController searchPokemonController;

  @override
  void initState() {
    super.initState();
    searchPokemonController = TextEditingController();
  }

  @override
  void dispose() {
    searchPokemonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return BlocBuilder<PokemonBloc, PokemonState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final bloc = context.read<PokemonBloc>();
        final pokemonFilteredList = state.filteredPokemons;
        if (state.status == BlocStatus.initial) {
          bloc.add(FetchPokemonData());
        }
        if (state.status == BlocStatus.loading) {
          return LoadingBar();
        }
        if (state.status == BlocStatus.error) {
          return PokemonError();
        }
        return Column(
          children: [
            Container(
              width: _width,
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocSelector<PokemonBloc, PokemonState, String> (
                    selector: (state) => state.selectedOption,
                    builder: (context, selectedOption) {
                      return DropdownButton<String>(
                        value: selectedOption,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: state.filterOptions.map((String option) {
                          return DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          bloc.add(FilterPokemon(filterOption: newValue!));
                          searchPokemonController.clear();
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: _width / 2,
                    child: TextField(
                      controller: searchPokemonController,
                      decoration: InputDecoration(
                        hintText: 'Search for a Pokemon!',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      onChanged: (value) {
                        bloc.add(SearchPokemon(searchedName: value));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: _height,
                width: _width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: pokemonFilteredList.length,
                  itemBuilder: (context, index) {
                    return PokemonCard(pokemon: pokemonFilteredList[index]);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
