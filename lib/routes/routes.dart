import 'package:flutter/material.dart';
import 'package:nft_wallet/home_screen/home_screen.dart';
import 'package:nft_wallet/routes/routes_constant.dart';
import 'package:nft_wallet/splash_screen/splash_screen.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstant.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case RouteConstant.homeScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    default:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}
