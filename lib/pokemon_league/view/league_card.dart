import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_league/models/league.dart';

class LeagueCard extends StatelessWidget {
  const LeagueCard({Key? key, required this.league}) : super(key: key);

  final League league;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
