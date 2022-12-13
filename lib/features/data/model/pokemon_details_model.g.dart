// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailModel _$PokemonDetailModelFromJson(Map<String, dynamic> json) =>
    PokemonDetailModel(
      json['id'] as int,
      json['name'] as String,
      (json['types'] as List<dynamic>)
          .map(
              (e) => PokemonTypeObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      PokemonSpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
      (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['height'] as int,
      json['weight'] as int,
    );

Map<String, dynamic> _$PokemonDetailModelToJson(PokemonDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'types': instance.types,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'height': instance.height,
      'weight': instance.weight,
    };

PokemonTypeObjectModel _$PokemonTypeObjectModelFromJson(
        Map<String, dynamic> json) =>
    PokemonTypeObjectModel(
      PokemonTypeModel.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeObjectModelToJson(
        PokemonTypeObjectModel instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

PokemonTypeModel _$PokemonTypeModelFromJson(Map<String, dynamic> json) =>
    PokemonTypeModel(
      json['name'] as String,
    );

Map<String, dynamic> _$PokemonTypeModelToJson(PokemonTypeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

PokemonSpritesModel _$PokemonSpritesModelFromJson(Map<String, dynamic> json) =>
    PokemonSpritesModel(
      PokemonSpritesOthersModel.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpritesModelToJson(
        PokemonSpritesModel instance) =>
    <String, dynamic>{
      'other': instance.other,
    };

PokemonSpritesOthersModel _$PokemonSpritesOthersModelFromJson(
        Map<String, dynamic> json) =>
    PokemonSpritesOthersModel(
      PokemonOfficialArtworkModel.fromJson(
          json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpritesOthersModelToJson(
        PokemonSpritesOthersModel instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
    };

PokemonOfficialArtworkModel _$PokemonOfficialArtworkModelFromJson(
        Map<String, dynamic> json) =>
    PokemonOfficialArtworkModel(
      json['front_default'] as String?,
    );

Map<String, dynamic> _$PokemonOfficialArtworkModelToJson(
        PokemonOfficialArtworkModel instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

PokemonStatsModel _$PokemonStatsModelFromJson(Map<String, dynamic> json) =>
    PokemonStatsModel(
      json['base_stat'] as int,
      json['effort'] as int,
      PokemonStatDetailModel.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatsModelToJson(PokemonStatsModel instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStats,
      'effort': instance.effort,
      'stat': instance.stat,
    };

PokemonStatDetailModel _$PokemonStatDetailModelFromJson(
        Map<String, dynamic> json) =>
    PokemonStatDetailModel(
      json['name'] as String,
    );

Map<String, dynamic> _$PokemonStatDetailModelToJson(
        PokemonStatDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
