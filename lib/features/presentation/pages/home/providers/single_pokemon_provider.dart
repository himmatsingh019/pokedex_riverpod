import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_riverpod/features/domain/entities/pokemon_list_entity.dart';

final singlePokemonProvider = Provider<PokemonListEntity>(
  (ref) => throw UnimplementedError(),
);
