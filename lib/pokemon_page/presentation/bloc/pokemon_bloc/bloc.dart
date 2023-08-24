import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ososstestapp/pokemon_page/domain/usecases/get_pokemon.dart';
import 'package:ososstestapp/pokemon_page/presentation/bloc/pokemon_bloc/event.dart';
import 'package:ososstestapp/pokemon_page/presentation/bloc/pokemon_bloc/state.dart';

import '../../../../core/failiure/failiures.dart';
import '../../../../core/response_type.dart';
import '../../../../core/usecases/usecase.dart';

class PokemonBloc extends Bloc<PokemonBlocEvent, PokemonState> {
  final GetPokemon? getPokemon;

  PokemonBloc({
    required this.getPokemon,
  }) : super(PokemonInitialState());

  Stream<PokemonState> errorState(Failure failure) async* {
    switch (failure.runtimeType) {
      case NetworkFailure:
      case ServerFailure:
      case SocketFailure:
      case TimeoutFailure:
      case UnHandledFailure:
        yield PokemonErrorState();
        break;
    }
  }

  @override
  Stream<PokemonState> mapEventToState(
    PokemonBlocEvent event,
  ) async* {
    if (event is GetPokemonEvent) {
      yield PokemonLoadingState();
      final failureOrDashboard = await getPokemon!(NoParams());
      yield* failureOrDashboard.fold(
        (l) async* {
          yield* errorState(l);
        },
        (r) async* {
          try {
            switch (r.responseType) {
              case ResponseType.SUCCESS:
                if (r.results != null)
                  yield PokemonLoadedState(pokemonEntity: r);
                else
                  yield PokemonErrorState();
                break;
              case ResponseType.VALIDATION_ERROR:
              case ResponseType.CLIENT_ERROR:
              case ResponseType.SERVER_ERROR:
              case ResponseType.NETWORK_ERROR:
              case ResponseType.TIMEOUT_ERROR:
                yield PokemonErrorState();
              default:
                yield PokemonErrorState();

                break;
            }
          } catch (e) {
            yield PokemonErrorState();
          }
        },
      );
    }
  }
}
