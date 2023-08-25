import 'package:dio/dio.dart';
import 'package:ososstestapp/core/appconst.dart';
import 'package:ososstestapp/core/response_type.dart' as res_type;
import '../../../core/exceptions/exceptions.dart';
import '../models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemonData();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio? dio;

  const PokemonRemoteDataSourceImpl({this.dio});

  @override
  Future<PokemonModel> getPokemonData() async {
    try {
      Response response = await dio!.get("${AppConst.baseUrl}pokemon",
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }));
      return _toPokemonModel(response: response);
    } on DioException catch (errorType) {
      throw testExceptionGlobal(errorType);
    }
  }

  PokemonModel _toPokemonModel({required Response<dynamic> response}) {
    var serverResponse = PokemonModel();
    if (response.data != null) {
      serverResponse = PokemonModel.fromJson(response.data);
      switch (response.statusCode) {
        case 200:
          serverResponse.responseType = res_type.ResponseType.SUCCESS;
          break;
        case 400:
        case 401:
        case 403:
          serverResponse.responseType = res_type.ResponseType.VALIDATION_ERROR;
          throw ValidationException();
        case 500:
          serverResponse.responseType = res_type.ResponseType.SERVER_ERROR;
          throw ServerException();
      }
    } else {
      serverResponse.responseType = res_type.ResponseType.CLIENT_ERROR;
      throw UnHandledException();
    }
    return serverResponse;
  }


}
