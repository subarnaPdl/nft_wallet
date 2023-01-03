import 'package:flutter/material.dart';
import 'package:nft_wallet/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MyAppBar(),
        ],
      ),
    );
  }
}
