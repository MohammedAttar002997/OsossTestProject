import 'package:equatable/equatable.dart';
import 'package:ososstestapp/pokemon_page/data/models/pokemon_model.dart';

import '../../../core/response_type.dart';

class PokemonEntity extends Equatable {
  final List<Result>? results;
  final ResponseType? responseType;

  const PokemonEntity({
    this.responseType,
    this.results,
  });

  @override
  List<Object?> get props => [results, responseType];
}
