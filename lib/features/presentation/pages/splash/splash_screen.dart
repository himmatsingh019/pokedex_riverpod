import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex_riverpod/core/config/navigation.dart';
import 'package:pokedex_riverpod/core/utils/constants.dart';
import 'package:pokedex_riverpod/core/utils/fonts.dart';
import 'package:pokedex_riverpod/core/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(
      const Duration(seconds: 3),
      () => Navigation.intentWithClearAllRoutes(
        context,
        AppRoutes.homeScreen,
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox.expand(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/png/logo.png',
              scale: 3.8,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'POKEMON',
                  style: AppFonts.extraBoldStyle(
                    fontColor: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Pokedex',
                  style: AppFonts.extraBoldStyle(
                    fontColor: AppColors.whiteColor,
                    fontSize: 42,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
