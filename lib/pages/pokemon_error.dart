import 'package:flutter/material.dart';

class PokemonError extends StatelessWidget {
  const PokemonError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Cannot Load Pokemon Data',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
