import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon_league/bloc/pokemon_league_bloc.dart';
import 'package:pokedex/pokemon_league/dialog/create_league_dialog.dart';
import 'package:pokedex/pokemon_league/view/league_card.dart';

class PokemonLeague extends StatefulWidget {
  const PokemonLeague({Key? key}) : super(key: key);

  @override
  State<PokemonLeague> createState() => _PokemonLeagueState();
}

class _PokemonLeagueState extends State<PokemonLeague> {
  final pokemonLeagueController = TextEditingController();

  @override
  void dispose() {
    pokemonLeagueController.dispose();  
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'League',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: BlocBuilder<PokemonLeagueBloc, PokemonLeagueState>(
          builder: (context, state) {
            final bloc = context.read<PokemonLeagueBloc>();
            final pokemonLeagues = state.pokemonLeagues;
            final pokemonFilteredLeagues = state.pokemonFilterLeagues;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      'Create League',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                      showDialog<void>(
                        context: context,
                        builder: (context) => CreateLeagueDialog(),
                      ),
                    },
                  ),
                  SizedBox(
                    width: _width < 450 ? _width / 3 : _width / 2,
                    child: TextField(
                      controller: pokemonLeagueController,
                      decoration: InputDecoration(
                        hintText: 'Search for a League!',
                        hintStyle: TextStyle(fontSize: _width < 450 ? 10 : 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      onChanged: (value) {
                        bloc.add(SearchLeague(input: value));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: ListView.builder(
                      itemCount: pokemonFilteredLeagues.length,
                      itemBuilder: (context, index) {
                        return LeagueCard(
                          league: pokemonFilteredLeagues[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
