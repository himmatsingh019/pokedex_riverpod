import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_riverpod/core/error/exception.dart';
import 'package:pokedex_riverpod/core/utils/custom_extension.dart';
import 'package:pokedex_riverpod/features/data/client/client.dart';
import 'package:pokedex_riverpod/features/data/model/pokemon_list_model.dart';

abstract class RemoteDataSource {
  Future<PokemonListModel> getPokemonsList({
    required final int limit,
  });
}

class RemoteDataSourceImpl extends RemoteDataSource {
  static final provider = Provider<RemoteDataSourceImpl>(
    (ref) => RemoteDataSourceImpl(
      client: ref.watch(RestClient.provider),
    ),
  );

  final RestClient client;

  RemoteDataSourceImpl({required this.client});

  void _processDio(err) {
    if (err is DioError) {
      throw ServerException(
        message: err.getErrorFromDio(),
      );
    } else {
      throw ServerException(message: 'Unknown error occurred');
    }
  }

  @override
  Future<PokemonListModel> getPokemonsList({
    required final int limit,
  }) async {
    try {
      return await client.getAllPokemons(limit).catchError((err) {
        _processDio(err);
      });
    } on DioError catch (e) {
      throw ServerException(message: e.getErrorFromDio());
    } on Exception {
      rethrow;
    }
  }
}
