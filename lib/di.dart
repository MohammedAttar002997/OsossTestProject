import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:ososstestapp/pokemon_page/data/datasources/pokemon_remote_datasource.dart';
import 'package:ososstestapp/pokemon_page/data/repositories/pokemon_repository_impl.dart';
import 'package:ososstestapp/pokemon_page/domain/repositories/pokemon_repository.dart';
import 'package:ososstestapp/pokemon_page/domain/usecases/get_pokemon.dart';
import 'package:ososstestapp/pokemon_page/presentation/bloc/pokemon_bloc/bloc.dart';

import 'core/appconst.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
//region Features - Dashboard

  sl.registerLazySingleton(() => getNetworkObj());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //region Bloc
  sl.registerFactory(() => PokemonBloc(getPokemon: sl()));
  //endregion

  //region Use cases
  sl.registerLazySingleton(() => GetPokemon(sl()));
  //endregion

  //region Repository
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      pokemonRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  //endregion

  //region Data sources
  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(dio: sl()),
  );
  //endregion

  //region Core

  //endregion

  //region External
  //endregion
  //endregion
}

Dio getNetworkObj() {
  BaseOptions options = BaseOptions(
    baseUrl: AppConst.baseUrl,
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );
  Dio dio = Dio(options);

  return dio;
}
