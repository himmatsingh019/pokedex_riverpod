import 'package:dartz/dartz.dart';
import 'package:pokedex_riverpod/core/error/failures.dart';
import 'package:pokedex_riverpod/features/domain/entities/pokemon_list_entity.dart';

abstract class Repository {
  Future<Either<Failure, List<PokemonListEntity>>> getPokemonsList({
    required final int limit,
  });
}
