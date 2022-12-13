import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_riverpod/core/config/navigation.dart';
import 'package:pokedex_riverpod/core/utils/constants.dart';
import 'package:pokedex_riverpod/core/utils/fonts.dart';
import 'package:pokedex_riverpod/core/utils/routes.dart';
import 'package:pokedex_riverpod/features/presentation/pages/home/providers/single_pokemon_index_provider.dart';
import 'package:pokedex_riverpod/features/presentation/pages/home/providers/single_pokemon_provider.dart';
import 'package:pokedex_riverpod/core/utils/custom_extension.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entity = ref.watch(singlePokemonProvider);
    final index = ref.watch(singlePokemonIndexProvider);

    return GestureDetector(
      onTap: () {
        Navigation.intent(context, AppRoutes.pokemonDetails);
      },
      child: Container(
        color: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 102,
              color: Colors.green.shade200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${index.toString().padLeft(3, '0')}',
                    style: AppFonts.extraBoldStyle(
                      fontColor: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    entity.name?.capitalize() ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.extraBoldStyle(
                      fontColor: AppColors.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Grass, Poison',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.extraBoldStyle(
                  fontColor: AppColors.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
