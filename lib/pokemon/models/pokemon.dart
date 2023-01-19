import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final String number;
  final String name;
  final String image;
  final String height;
  final String weight;
  final List<String> type;
  final List<String> weaknesses;

  static const empty = Pokemon(
    number: '',
    name: '',
    image: '',
    height: '',
    weight: '',
    type: [],
    weaknesses: [],
  );

  const Pokemon({
    required this.number,
    required this.name, 
    required this.image,     
    required this.height, 
    required this.weight,
    required this.type,
    required this.weaknesses});

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}