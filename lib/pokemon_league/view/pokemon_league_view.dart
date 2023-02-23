import 'package:flutter/material.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // trigger a dialog
            TextButton(
              child: Text(
                'Create League',
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
            Container(),
          ],
        ));
  }
}
