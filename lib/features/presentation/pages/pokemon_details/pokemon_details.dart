import 'package:flutter/material.dart';
import 'package:pokedex_riverpod/core/config/navigation.dart';
import 'package:pokedex_riverpod/core/utils/constants.dart';
import 'package:pokedex_riverpod/core/utils/fonts.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appbar(context),
        ],
      ),
    );
  }

  SliverAppBar _appbar(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      floating: false,
      pinned: true,
      bottom: _getPokemonHeightWeightAndBMI(width),
      toolbarHeight: kToolbarHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: getAppBarBackground(),
      ),
      leading: InkWell(
        onTap: () => Navigation.back(context),
        child: const Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColors.blackColor,
        ),
      ),
      expandedHeight: 320,
      backgroundColor: Colors.white,
    );
  }

  Container getAppBarBackground() {
    return Container(
      color: Colors.amber.withOpacity(0.2),
      child: Stack(
        children: [
          // Align(
          //   alignment: const Alignment(1, 0.5),
          //   child: SvgPicture.asset(ImageConstants.icPokemonOutline),
          // ),
          // Align(
          //   alignment: const Alignment(0.9, 0.50),
          //   child: NetworkImageWidget(
          //     imageUrl: _pokemonDetailEntity?.imageUrl ?? "",
          //     width: 136,
          //     height: 125,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          Align(
            alignment: const Alignment(-1, -0.2),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Bulbasaur',
                    style: AppFonts.extraBoldStyle(
                      fontColor: AppColors.blackColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Type',
                    style: AppFonts.extraBoldStyle(
                      fontColor: AppColors.greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1, 0.5),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                '#0001',
                style: AppFonts.extraBoldStyle(
                  fontColor: AppColors.greyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  PreferredSize _getPokemonHeightWeightAndBMI(double width) {
    return PreferredSize(
      preferredSize: Size(
        width,
        70,
      ),
      child: Container(
        color: AppColors.whiteColor,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _getInformationColumn(
              label: 'Height',
              info: '10',
            ),
            const SizedBox(width: 48),
            _getInformationColumn(
              label: 'Weight',
              info: '20',
            ),
            const SizedBox(width: 48),
            _getInformationColumn(
              label: 'BMI',
              info: '4.3',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getInformationColumn(
      {required final String label, required final String info}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.extraBoldStyle(
            fontSize: 12,
            fontColor: AppColors.greyColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          info,
          style: AppFonts.extraBoldStyle(
            fontSize: 12,
            fontColor: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
