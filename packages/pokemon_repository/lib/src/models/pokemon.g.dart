// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      number: json['number'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'image': instance.image,
      'height': instance.height,
      'weight': instance.weight,
      'type': instance.type,
      'weaknesses': instance.weaknesses,
    };
