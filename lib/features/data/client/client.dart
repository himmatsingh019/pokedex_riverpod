import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_riverpod/features/data/model/pokemon_details_model.dart';
import 'package:pokedex_riverpod/features/data/model/pokemon_list_model.dart';
import 'package:pokedex_riverpod/shared/providers/dio_provider.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: "https://pokeapi.co/api/v2/")
abstract class RestClient {
  static final provider =
      Provider<RestClient>((ref) => RestClient(ref.watch(dioProvider)));

  factory RestClient(final Dio dio) {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (option, handler) async {
      return handler.next(option);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
    return _RestClient(dio);
  }

  @GET("pokemon")
  Future<PokemonListModel> getAllPokemons(
    @Query("limit") final int limit,
  );
}
