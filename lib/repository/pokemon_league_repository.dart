import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokedex/pokemon_league/models/league.dart';

class PokemonLeagueRepository {
  PokemonLeagueRepository({required FirebaseFirestore fireBaseFireStore})
      : _fireBaseFireStore = fireBaseFireStore;

  final FirebaseFirestore _fireBaseFireStore;

  Future<void> createLeague(League leagueData) async {
    await _fireBaseFireStore.collection('League').add(leagueData.toJson());
  }

  Stream<List<League>> getLeagues() =>
      _fireBaseFireStore.collection('League').snapshots().map(
          (event) => event.docs.map((e) => League.fromJson(e.data())).toList());

  Stream<List<Map<String, List<String>>>> getRosters(String roomId) {
    return _fireBaseFireStore
        .collection('League')
        .where('roomId', isEqualTo: roomId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => League.fromJson(doc.data()))
            .expand((league) => league.teamRoster)
            .toList());
  }

  Future<void> addRoster(
      List<Map<String, List<String>>> team, String roomId) async {
    final querySnapshot = await _fireBaseFireStore
        .collection('League')
        .where('roomId', isEqualTo: roomId)
        .get();
    await querySnapshot.docs[0].reference.update({'teamRoster': team});
  }
}
