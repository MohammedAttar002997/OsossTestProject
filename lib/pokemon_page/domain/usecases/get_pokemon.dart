import 'package:dartz/dartz.dart';
import 'package:ososstestapp/pokemon_page/domain/entities/pokemon_entity.dart';
import 'package:ososstestapp/pokemon_page/domain/repositories/pokemon_repository.dart';

import '../../../core/failiure/failiures.dart';
import '../../../core/usecases/usecase.dart';

class GetPokemon implements UseCase<PokemonEntity, NoParams> {
  final PokemonRepository? repository;

  GetPokemon(this.repository);

  @override
  Future<Either<Failure, PokemonEntity>> call(NoParams noParams) async {
    return await repository!.getPokemonInfo();
  }
}
