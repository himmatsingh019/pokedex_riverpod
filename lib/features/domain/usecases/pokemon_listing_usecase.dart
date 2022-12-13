import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_riverpod/core/error/failures.dart';
import 'package:pokedex_riverpod/core/usecase/usecase.dart';
import 'package:pokedex_riverpod/features/data/repository/repository_impl.dart';
import 'package:pokedex_riverpod/features/domain/entities/pokemon_list_entity.dart';
import 'package:pokedex_riverpod/features/domain/repository/repository.dart';

class PokemonListingUseCase extends UseCase<List<PokemonListEntity>, NoParams> {
  static final provider = Provider<PokemonListingUseCase>(
    (ref) => PokemonListingUseCase(
      ref.watch(RepositoryImpl.provider),
    ),
  );

  final Repository _repository;

  PokemonListingUseCase(this._repository);

  @override
  Future<Either<Failure, List<PokemonListEntity>>> call(NoParams params) async {
    return await _repository.getPokemonsList(limit: 21);
  }
}
