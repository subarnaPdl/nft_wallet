import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_wallet/home_screen/pages/home_page/home_page.dart';
import 'package:nft_wallet/home_screen/pages/market_page/market_page.dart';
import 'package:nft_wallet/home_screen/pages/profile_page/profile_page.dart';
import 'package:nft_wallet/home_screen/pages/wallet_page/wallet_page.dart';
import 'package:nft_wallet/theme/uiparameters.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  // Nabbar pages
  final List<Widget> pages = const [
    HomePage(),
    WalletPage(),
    WalletPage(), // Place for Swap Button | Had to add due to error in package | ERROR: pages should be equal to the number of items
    MarketPage(),
    ProfilePage(),
  ];

  final PersistentTabController _persistentTabController =
      PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: PersistentTabView(
        context,
        controller: _persistentTabController,
        navBarStyle: NavBarStyle.style15,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        navBarHeight: UIParameters.getHeight(context) / 10,
        padding: const NavBarPadding.symmetric(horizontal: 10, vertical: 10),
        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(25),
            right: Radius.circular(25),
          ),
        ),
        screens: pages,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        items: _items(context),
      ),
    );
  }

  List<PersistentBottomNavBarItem>? _items(BuildContext context) {
    return [
      // HomePage
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/home.png'),
        title: 'Home',
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onSecondary,
      ),

      // WalletPage
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/wallet.png'),
        title: 'Wallet',
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onSecondary,
      ),

      // Swap
      PersistentBottomNavBarItem(
        onPressed: (_) {},
        icon: Image.asset('assets/images/swap.png'),
        title: 'Swap',
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onSecondary,
      ),

      // MarketPage
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/market.png'),
        title: 'Market',
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onSecondary,
      ),

      // ProfilePage
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/profile.png'),
        title: 'Profile',
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onSecondary,
      ),
    ];
  }
}
