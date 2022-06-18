import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Map<String, Color> _MapTypesToColors = {
  'Fire' : Colors.deepOrange,
  'Grass' : Colors.green[400]!,
  'Water' : Colors.blue[700]!,
  'Poison' : Colors.purple,
  'Normal' : Colors.grey[400]!,
  'Electric' : Colors.yellow[600]!,
  'Bug' : Colors.lightGreen[200]!,
  'Ground' : Colors.lime[100]!,
  'Fighting' : Colors.red[700]!,
  'Psychic' : Colors.pink[100]!,
  'Rock' : Colors.brown[200]!,
  'Ghost' : Colors.deepPurple,
  'Ice' : Colors.lightBlue[100]!,
  'Dragon' : Colors.purple[900]!,
};

Color? retrievePokemonType(String pokemonType) {
  if(_MapTypesToColors.containsKey(pokemonType)) {
    return _MapTypesToColors[pokemonType];
  }
  return Colors.grey;
}