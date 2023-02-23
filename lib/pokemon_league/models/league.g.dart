// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      name: json['name'] as String,
      participants: json['participants'] as int,
      entryFee: json['entryFee'] as int,
      prizeFee: json['prizeFee'] as int,
      roomId: json['roomId'] as String,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'name': instance.name,
      'participants': instance.participants,
      'entryFee': instance.entryFee,
      'prizeFee': instance.prizeFee,
      'roomId': instance.roomId,
    };
