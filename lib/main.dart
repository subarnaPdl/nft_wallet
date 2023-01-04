import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_wallet/routes/routes.dart';
import 'package:nft_wallet/routes/routes_constant.dart';
import 'package:nft_wallet/theme/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock in portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Make status bar transparent throughout the app
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NTF Wallet App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes,
      theme: AppColors().themeData(),
      initialRoute: RouteConstant.splashScreen,
    );
  }
}
