import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';

class FillPokemonDetails extends StatefulWidget {
  const FillPokemonDetails({Key? key}) : super(key: key);

  @override
  State<FillPokemonDetails> createState() => _FillPokemonDetailsState();
}

class _FillPokemonDetailsState extends State<FillPokemonDetails> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _weaknessesController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _imageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _typeController.dispose();
    _weaknessesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 500,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                hintText: 'enter pokemon ID',
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'enter pokemon name',
              ),
            ),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                hintText: 'upload image',
              ),
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                hintText: 'enter pokemon height',
              ),
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                hintText: 'enter pokemon weight',
              ),
            ),
            TextField(
              controller: _typeController,
              decoration: InputDecoration(
                hintText: 'enter pokemon type(s)',
              ),
            ),
            TextField(
              controller: _weaknessesController,
              decoration: InputDecoration(
                hintText: 'enter pokemon weaknesses(s)',
              ),
            ),
            TextButton(
              onPressed: () => {
                context.read<PokemonBloc>().add(
                      UploadPokemon(
                        number: _idController.text,
                        name: _nameController.text,
                        image: _imageController.text,
                        height: _heightController.text,
                        weight: _weightController.text,
                        type: _typeController.text,
                        weaknesses: _typeController.text,
                      ),
                    )
              },
              child: const Text('Submit data'),
            ),
          ],
        ),
      ),
    );
  }
}
