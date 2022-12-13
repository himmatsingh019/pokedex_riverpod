import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_riverpod/core/utils/constants.dart';
import 'package:pokedex_riverpod/core/utils/routes.dart';
import 'package:pokedex_riverpod/features/presentation/pages/home/home.dart';
import 'package:pokedex_riverpod/features/presentation/pages/pokemon_details/pokemon_details.dart';
import 'package:pokedex_riverpod/features/presentation/pages/splash/splash_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      routes: _registerRoutes(),
      initialRoute: AppRoutes.splash,
    );
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return <String, WidgetBuilder>{
      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.homeScreen: (context) => const HomeScreen(),
      AppRoutes.pokemonDetails: (context) => const PokemonDetailsScreen(),
    };
  }
}
