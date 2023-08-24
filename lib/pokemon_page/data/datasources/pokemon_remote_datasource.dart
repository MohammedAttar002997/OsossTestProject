import 'package:dio/dio.dart';
import 'package:ososstestapp/core/appconst.dart';
import 'package:ososstestapp/core/response_type.dart' as ResType;
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
      Response response = await dio!.get("${AppConst.BaseUrl}pokemon",
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }));
      return _toPokemonModel(response: response);
    } on DioError catch (errorType) {
      throw testExceptionGlobal(errorType);
    }
  }

  PokemonModel _toPokemonModel({required Response<dynamic> response}) {
    var serverResponse = PokemonModel();
    if (response.data != null) {
      serverResponse = PokemonModel.fromJson(response.data);
      switch (response.statusCode) {
        case 200:
          serverResponse.responseType = ResType.ResponseType.SUCCESS;
          break;
        case 400:
        case 401:
        case 403:
          serverResponse.responseType = ResType.ResponseType.VALIDATION_ERROR;
          throw ValidationException();
        case 500:
          serverResponse.responseType = ResType.ResponseType.SERVER_ERROR;
          throw ServerException();
      }
    } else {
      serverResponse.responseType = ResType.ResponseType.CLIENT_ERROR;
      throw UnHandledException();
    }
    return serverResponse;
  }


}
