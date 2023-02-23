import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon_league/bloc/pokemon_league_bloc.dart';
import 'package:pokedex/pokemon_league/dialog/create_league_dialog.dart';

class PokemonLeague extends StatelessWidget {
  const PokemonLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // trigger a dialog
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
                // divider
                Divider(
                  color: Colors.red,
                  thickness: 5,
                ),
                // listview
                SizedBox(
                  width: 500,
                  height: 500,
                  child: ListView.builder(
                    itemCount: pokemonLeagues.length,
                    itemBuilder: (context, index) {
                      return Text(pokemonLeagues[index].name);
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
