import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:league_repository/league_repository.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/dialog/pokemon_selection.dart';
import 'package:pokedex/pokemon_league/bloc/pokemon_league_bloc.dart';
import 'package:pokedex/pokemon_league_page/bloc/pokemon_league_page_bloc.dart';
import 'package:pokedex/utils/bloc_status.dart';
import 'package:pokedex/utils/map_pokemon_type_to_color.dart';

class PokemonLeaguePage extends StatelessWidget {
  const PokemonLeaguePage({
    Key? key,
    required this.league,
    required this.roomId,
  }) : super(key: key);

  final League league;
  final String roomId;

  @override
  Widget build(BuildContext context) {
    final pokemonRoster =
        context.select((PokemonBloc bloc) => bloc.state.pokemonRoster);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          league.name,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: BlocBuilder<PokemonLeaguePageBloc, PokemonLeaguePageState>(
        builder: (context, state) {
          final teamRosters = state.pokemonRosters;
          final bloc = context.read<PokemonLeaguePageBloc>();
          if (state.status == BlocStatus.initial) {
            bloc.add(FetchLeagueRoster(roomId: league.roomId));
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'My Team',
                    style: TextStyle(color: Colors.red),
                  ),
                  Container(
                    width: 500,
                    height: 500,
                    color: Colors.red,
                    child: ListView.builder(
                      itemCount: pokemonRoster.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 500,
                          height: 100,
                          child: Container(
                            color: retrievePokemonType(
                                pokemonRoster[index].type[0])!,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(pokemonRoster[index].image),
                                Text(
                                  pokemonRoster[index].name,
                                  style: TextStyle(color: Colors.black),
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: () => {
                                      context.read<PokemonBloc>().add(
                                            RemovePokemonFromRoster(
                                              pokemon: pokemonRoster[index],
                                            ),
                                          )
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: retrievePokemonType(
                                        pokemonRoster[index].type[0],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        color: Colors.red,
                        onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (context) => PokemonSelection(),
                          )
                        },
                        icon: Icon(Icons.add),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () => {
                          context.read<PokemonBloc>().add(
                                ClearPokemonRoster(),
                              ),
                        },
                        child: Text(
                          'Clear Selection',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () => {
                          context.read<PokemonLeagueBloc>().add(
                                AddRosterToLeague(
                                  pokemonNames:
                                      pokemonRoster.map((e) => e.name).toList(),
                                  teamRosters: teamRosters,
                                  roomId: league.roomId,
                                ),
                              ),
                          context.read<PokemonBloc>().add(
                                ClearPokemonRoster(),
                              ),
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'All Teams',
                    style: TextStyle(color: Colors.red),
                  ),
                  Container(
                    width: 500,
                    height: 500,
                    color: Colors.red,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: teamRosters.length,
                      itemBuilder: (context, index) {
                        final userId = teamRosters[index].keys.single;
                        final teamRosterString =
                            teamRosters[index].values.toString();
                        return SizedBox(
                          width: 500,
                          height: 100,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Name: ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    userId,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Roster: ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    teamRosterString,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
