import 'package:dartz/dartz.dart';
import 'package:ososstestapp/pokemon_page/domain/entities/pokemon_entity.dart';
import '../../../core/failiure/failiures.dart';
import '../../../core/network/network_info.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  //region Variables
  final PokemonRemoteDataSource? pokemonRemoteDataSource;
  final NetworkInfo networkInfo;

  //endregion

  //region Constructor
  PokemonRepositoryImpl({
    required this.pokemonRemoteDataSource,
    required this.networkInfo,
  });

  //endregion

  @override
  Future<Either<Failure, PokemonEntity>> getPokemonInfo() async {
    try {
      if (await networkInfo.isConnected) {
        final pokemonData =
        await pokemonRemoteDataSource!.getPokemonData();
        if (pokemonData.results != null) {
          return Right(pokemonData);
        } else {
          return Left(ServerFailure());
        }
      } else {
        return Left(NetworkFailure());
      }
    } on Exception catch (exceptionType) {
      return Left(testExceptionFailure(exceptionType));
    }
  }
}
