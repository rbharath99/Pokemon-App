import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon_league/bloc/pokemon_league_bloc.dart';

class CreateLeagueDialog extends StatelessWidget {
  const CreateLeagueDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final participantsController = TextEditingController();
    final entryFeeController = TextEditingController();
    final prizeFeeController = TextEditingController();
    return Dialog(
      child: SizedBox(
        width: 350,
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name'),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(),
                      controller: nameController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Participants'),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(),
                      controller: participantsController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Entry Fee'),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(),
                      controller: entryFeeController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Prize Fee'),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(),
                      controller: prizeFeeController,
                    ),
                  ),
                ],
              ),
              Spacer(),
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
                  'Create League!',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  BlocProvider.of<PokemonLeagueBloc>(context).add(
                    CreateLeague(
                      name: nameController.text,
                      participants: participantsController.text,
                      entryFee: entryFeeController.text,
                      prizeFee: prizeFeeController.text,
                    ),
                  ),
                  Navigator.pop(context),
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
