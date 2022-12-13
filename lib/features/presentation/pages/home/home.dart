import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_riverpod/core/common_widgets/pokemon_card.dart';
import 'package:pokedex_riverpod/core/utils/constants.dart';
import 'package:pokedex_riverpod/core/utils/fonts.dart';
import 'package:pokedex_riverpod/features/presentation/controllers/pokemon_listing_controller.dart';
import 'package:pokedex_riverpod/features/presentation/pages/home/providers/single_pokemon_index_provider.dart';
import 'package:pokedex_riverpod/features/presentation/pages/home/providers/single_pokemon_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorWeight: 3,
              labelColor: AppColors.blackColor,
              unselectedLabelColor: AppColors.blackColor.withOpacity(0.4),
              labelStyle: AppFonts.extraBoldStyle(fontSize: 16),
              indicatorColor: AppColors.backgroundColor,
              tabs: const [
                Tab(
                  text: 'All Pokemons',
                ),
                Tab(
                  text: 'Favourites',
                ),
              ],
            ),
            backgroundColor: AppColors.whiteColor,
            toolbarHeight: 60,
            elevation: 1,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/png/logo.png',
                  scale: 12,
                ),
                const SizedBox(width: 10),
                Text(
                  'Pokedex',
                  style: AppFonts.extraBoldStyle(fontSize: 22),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey.shade300,
          body: const TabBarView(
            children: [
              AllPokemonView(),
              FavouritesView(),
            ],
          ),
        ),
      ),
    );
  }
}

class AllPokemonView extends ConsumerWidget {
  const AllPokemonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(PokemonListingController.provider);

    return provider.when(
      data: (data) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 186,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: data.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        itemBuilder: (context, index) {
          return ProviderScope(
            overrides: [
              singlePokemonProvider.overrideWithValue(data[index]),
              singlePokemonIndexProvider.overrideWithValue(index + 1),
            ],
            child: const PokemonCard(),
          );
        },
      ),
      error: (e, s) {
        print(s);
        return Center(
          child: Text(
            e.toString(),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class FavouritesView extends StatelessWidget {
  const FavouritesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('fav'),
      ],
    );
  }
}
