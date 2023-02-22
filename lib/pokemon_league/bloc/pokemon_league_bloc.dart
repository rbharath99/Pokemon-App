import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_league_event.dart';
part 'pokemon_league_state.dart';

class PokemonLeagueBloc extends Bloc<PokemonLeagueEvent, PokemonLeagueState> {
  PokemonLeagueBloc() : super(PokemonLeagueInitial()) {
    on<PokemonLeagueEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
