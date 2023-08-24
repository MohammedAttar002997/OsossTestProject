// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

import 'package:ososstestapp/pokemon_page/domain/entities/pokemon_entity.dart';

import '../../../core/response_type.dart';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel extends PokemonEntity {
  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;
  ResponseType? responseType;

  PokemonModel({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.responseType,
  }):super(responseType: responseType);

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? name;
  String? url;

  Result({
    this.name,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
