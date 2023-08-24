import 'package:dartz/dartz.dart';
import 'package:ososstestapp/pokemon_page/domain/entities/pokemon_entity.dart';
import '../../../core/failiure/failiures.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonEntity>> getPokemonInfo();
}
