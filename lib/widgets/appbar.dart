import 'package:flutter/material.dart';
import 'package:nft_wallet/theme/colors.dart';

class MyAppBar extends StatelessWidget {
  final bool showTitle;
  final String title;
  final bool showAccount;

  const MyAppBar({
    Key? key,
    this.showTitle = false,
    this.title = '',
    this.showAccount = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Row(
        children: [
          showAccount ? account() : const Spacer(),
          if (showTitle) headTitle(title),
          const Spacer(),
          notifications(context),
        ],
      ),
    );
  }

  Widget account() {
    return Row(
      children: [
        Image.asset('assets/images/account.png'),
        const SizedBox(width: 8),
        const Text(
          'Account_1',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget headTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget notifications(BuildContext context) {
    return Stack(
      children: [
        Positioned(child: Image.asset('assets/images/notification.png')),
        Positioned(
          height: 18,
          width: 18,
          left: 14,
          child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child: Text(
                '5',
                style: TextStyle(color: AppColors().white, fontSize: 12),
              )),
        ),
      ],
    );
  }
}