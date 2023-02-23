import 'package:json_annotation/json_annotation.dart';

part 'league.g.dart';

@JsonSerializable()
class League {
  final String name;
  final int participants;
  final int entryFee;
  final int prizeFee;
  final String roomId;

  static const empty = League(
    name: '',
    participants: 0,
    entryFee: 0,
    prizeFee: 0,
    roomId: '',
  );

  const League({
    required this.name,
    required this.participants,
    required this.entryFee,
    required this.prizeFee,
    required this.roomId,
  });

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}
