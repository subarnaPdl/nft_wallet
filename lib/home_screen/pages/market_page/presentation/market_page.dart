import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nft_wallet/home_screen/pages/market_page/domain/market_data.dart';
import 'package:nft_wallet/theme/colors.dart';
import 'package:nft_wallet/theme/uiparameters.dart';
import 'package:nft_wallet/widgets/appbar.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/frame.png'),
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: UIParameters.getStatusBarHeight(context)),
          const MyAppBar(
            showTitle: true,
            showAccount: false,
            title: 'Market',
          ),
          const SizedBox(height: 20),
          categoryRow(context),
          const SizedBox(height: 20),
          Expanded(child: marketGrid()),
          // Additional space for bottom nabbar
          const SizedBox(height: 28),
        ],
      ),
    );
  }

  Widget categoryRow(BuildContext context) {
    int selectedIndex = 0;

    List categories = ['All NFTs', 'Art', 'Collectibles', 'Music', 'Photos'];

    Container cat(String title) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(0.15),
              border: selectedIndex == categories.indexOf(title)
                  ? Border.all(color: Theme.of(context).colorScheme.tertiary)
                  : null),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(title),
          ),
        );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            for (String c in categories) cat(c),
          ],
        ),
      ),
    );
  }

  Padding marketGrid() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
      child: AlignedGridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        shrinkWrap: true,
        itemCount: marketData.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/avatar/${marketData[index].img}',
                      fit: BoxFit.fill,
                    ),

                    // Reacts
                    Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(0.5),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.favorite_border_rounded,
                                  size: 12,
                                  color: AppColors().black,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  marketData[index].reacts.toString(),
                                  style: TextStyle(
                                    color: AppColors().black,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(marketData[index].title),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('#${marketData[index].id}'),
                          const Spacer(),
                          Image.asset(
                            'assets/images/ethereum_icon.png',
                            height: 10,
                          ),
                          Text(marketData[index].value.toString()),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
