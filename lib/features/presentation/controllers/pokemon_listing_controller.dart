import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_riverpod/core/usecase/usecase.dart';
import 'package:pokedex_riverpod/features/domain/entities/pokemon_list_entity.dart';
import 'package:pokedex_riverpod/features/domain/usecases/pokemon_listing_usecase.dart';

class PokemonListingController
    extends StateNotifier<AsyncValue<List<PokemonListEntity>>> {
  static final provider = StateNotifierProvider<PokemonListingController,
      AsyncValue<List<PokemonListEntity>>>(
    (ref) => PokemonListingController(
      ref.watch(
        PokemonListingUseCase.provider,
      ),
    ),
  );

  PokemonListingController(
    this.pokemonListingUseCase,
  ) : super(const AsyncValue.loading()) {
    fetchPokemonList();
  }

  final PokemonListingUseCase pokemonListingUseCase;

  void fetchPokemonList() async {
    final result = await pokemonListingUseCase(NoParams());

    result.fold(
      (l) {
        state = const AsyncValue.error('Something went wrong');
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
