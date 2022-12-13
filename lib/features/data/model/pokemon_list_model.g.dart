// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListModel _$PokemonListModelFromJson(Map<String, dynamic> json) =>
    PokemonListModel(
      results: (json['results'] as List<dynamic>?)
          ?.map(
              (e) => PokemonListResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonListModelToJson(PokemonListModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

PokemonListResultModel _$PokemonListResultModelFromJson(
        Map<String, dynamic> json) =>
    PokemonListResultModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonListResultModelToJson(
        PokemonListResultModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
