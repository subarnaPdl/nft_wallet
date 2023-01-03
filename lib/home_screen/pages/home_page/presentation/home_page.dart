import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nft_wallet/home_screen/pages/home_page/domain/data.dart';
import 'package:nft_wallet/theme/uiparameters.dart';
import 'package:nft_wallet/widgets/appbar.dart';
import 'package:nft_wallet/widgets/gradient_button.dart';
import 'package:nft_wallet/widgets/listtile.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/frame.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: UIParameters.getStatusBarHeight(context)),
                const MyAppBar(),
                const Spacer(),
                currentWalletBalance(context),
                const Spacer(),
                balanceOptions(context),
                const Spacer(),
                tabViewTabs(context),
                const Spacer(),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(child: tokensData(context)),
        ),
      ],
    );
  }

  Widget currentWalletBalance(BuildContext context) {
    return Column(
      children: [
        const Text('Current Wallet Balance'),
        const SizedBox(height: 10),

        // Balance
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '\$ 5,323.00',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 14,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
        const SizedBox(height: 10),

        // BTC Value
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('BTC : 0.00335'),
                const SizedBox(width: 5),
                Icon(
                  Icons.arrow_drop_up_rounded,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                Text(
                  '+6.54%',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget balanceOptions(BuildContext context) {
    Column item({required Widget img, required String label}) => Column(
          children: [
            Container(
              height: min(UIParameters.getWidth(context) / 4, 80),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  shape: BoxShape.circle),
              child: img,
            ),
            const SizedBox(height: 10),
            Text(label),
          ],
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Send
        item(
          img: Image.asset('assets/images/send.png'),
          label: 'Send',
        ),

        // Buy
        item(
          img: const GradientButton(img: 'assets/images/add.png'),
          label: 'Buy',
        ),

        // Receive
        item(
          img: Image.asset('assets/images/receive.png'),
          label: 'Receive',
        ),
      ],
    );
  }

  Widget tabViewTabs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: TabBar(
          controller: _tabController,
          splashBorderRadius: BorderRadius.circular(100),
          tabs: const [
            Tab(text: "Tokens"),
            Tab(text: "NFTs"),
          ],
          indicator: RectangularIndicator(
            bottomLeftRadius: 100,
            bottomRightRadius: 100,
            topLeftRadius: 100,
            topRightRadius: 100,
            horizontalPadding: 3,
            verticalPadding: 3,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget tokensData(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: tokens.length,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return MyListTile(index: index);
      },
    );
  }
}