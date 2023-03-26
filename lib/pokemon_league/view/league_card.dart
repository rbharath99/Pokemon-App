import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon_league/bloc/pokemon_league_bloc.dart';
import 'package:league_repository/league_repository.dart';

class LeagueCard extends StatelessWidget {
  const LeagueCard({Key? key, required this.league}) : super(key: key);

  final League league;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.pushNamed(
          'league',
          params: {
            'roomID': league.roomId,
          },
          extra: league.name,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name:',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  league.name,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Participants',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '${league.participants}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Entry Fee',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '${league.entryFee}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Prize Fee',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '${league.prizeFee}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () {
                context.read<PokemonLeagueBloc>().add(
                      DeleteLeague(
                        roomId: league.roomId,
                      ),
                    );
              },
              child: Text(
                'Delete League',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
