import 'package:equatable/equatable.dart';
import 'package:ososstestapp/pokemon_page/domain/entities/pokemon_entity.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitialState extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonErrorState extends PokemonState {}

class PokemonLoadedState extends PokemonState {
  final PokemonEntity? pokemonEntity;

  PokemonLoadedState({this.pokemonEntity});
}
