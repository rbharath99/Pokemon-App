import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/view/my_pokemon_view.dart';
import 'package:pokedex/pokemon/view/pokemon_card.dart';
import 'package:pokedex/pokemon/view/pokemon_team.dart';
import 'package:pokedex/utils/status_widgets/pokemon_error.dart';
import 'package:pokedex/utils/status_widgets/loading_bar.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/utils/bloc_status.dart';
import 'package:pokedex/utils/toast_view.dart';

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
    return BlocConsumer<PokemonBloc, PokemonState>(
      listener: (context, state) {
        if (state.status == BlocStatus.added) {
          context.showPokemonAdded();
        }
        if (state.status == BlocStatus.removed) {
          context.showPokemonRemoved();
        }
        if (state.status == BlocStatus.pokemonExisted) {
          context.showPokemonExistedMessage();
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final bloc = context.read<PokemonBloc>();
        final pokemonFilteredList = state.filteredPokemons;
        final myPokemonList = state.myPokemons;
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: _width,
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BlocSelector<PokemonBloc, PokemonState, String>(
                        selector: (state) => state.selectedOption,
                        builder: (context, selectedOption) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.red,
                              border: Border.all(style: BorderStyle.none),
                            ),
                            child: DropdownButton<String>(
                              iconEnabledColor: Colors.white,
                              dropdownColor: Colors.red,
                              underline: Container(),
                              style: TextStyle(color: Colors.white),
                              value: selectedOption,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: state.filterOptions.map((String option) {
                                return DropdownMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                bloc.add(
                                    FilterPokemon(filterOption: newValue!));
                                searchPokemonController.clear();
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 5),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPokemonListView(
                                myPokemonList: myPokemonList,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'My Pokemon',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 5),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonTeam(
                                myPokemonList: myPokemonList,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Pokemon Team',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: _width < 450 ? _width / 3 : _width / 2,
                    child: TextField(
                      controller: searchPokemonController,
                      decoration: InputDecoration(
                        hintText: 'Search for a Pokemon!',
                        hintStyle: TextStyle(fontSize: _width < 450 ? 10 : 15),
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
