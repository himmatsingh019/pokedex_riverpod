import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_riverpod/core/error/exception.dart';
import 'package:pokedex_riverpod/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_riverpod/core/network/network_info.dart';
import 'package:pokedex_riverpod/features/data/datasource/remote_datasource.dart';
import 'package:pokedex_riverpod/features/data/model/pokemon_list_model.dart';
import 'package:pokedex_riverpod/features/domain/entities/pokemon_list_entity.dart';
import 'package:pokedex_riverpod/features/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  static final provider = Provider<RepositoryImpl>(
    (ref) => RepositoryImpl(
      remoteDataSource: ref.watch(RemoteDataSourceImpl.provider),
      networkInfo: ref.watch(NetworkInfoImpl.provider),
    ),
  );

  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PokemonListEntity>>> getPokemonsList({
    required final int limit,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await remoteDataSource.getPokemonsList(limit: limit);

        List<PokemonListEntity> entity = List.empty(growable: true);

        for (PokemonListResultModel model in result.results ?? []) {
          entity.add(PokemonListEntity(
            name: model.name,
            url: model.url,
          ));
        }

        return Right(entity);
      } else {
        return Left(ServerFailure(message: 'No Internet Connection'));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
