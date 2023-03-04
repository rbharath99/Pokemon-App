import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokedex/pokemon_league/models/league.dart';

class PokemonLeagueRepository {
  PokemonLeagueRepository({required FirebaseFirestore fireBaseFireStore})
      : _fireBaseFireStore = fireBaseFireStore;

  final FirebaseFirestore _fireBaseFireStore;

  Future<void> createLeague(League leagueData) async {
    await _fireBaseFireStore.collection('League').add(leagueData.toJson());
  }

  Future<List<League>> fetchLeagues() async {
    final snapshot = await _fireBaseFireStore.collection('League').get();
    return snapshot.docs.map((e) => League.fromJson(e.data())).toList();
  }

  Future<void> addRoster(List<String> team, String roomId) async {
    print(team);
    print(roomId);
    await _fireBaseFireStore
        .collection('League')
        .doc('GAYPHbZ3mcK9o7kUky5W')
        .update(
      {
        'teamRoster': team,
      },
    );
  }
}
