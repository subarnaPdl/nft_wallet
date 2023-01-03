import 'package:nft_wallet/home_screen/pages/home_page/domain/chart_data_model.dart';

Map tokens = {
  0: {
    'shortForm': 'BTC',
    'fullForm': 'Bitcoin',
    'img': 'bitcoin.png',
    'value': '\$36,590.00',
    'changeRate': '6.21%',
    'isIncreased': true,
  },
  1: {
    'shortForm': 'ETH',
    'fullForm': 'Ethereum',
    'img': 'ethereum.png',
    'value': '\$2,950.00',
    'changeRate': '5.21%',
    'isIncreased': false,
  },
  2: {
    'shortForm': 'SOL',
    'fullForm': 'Solona',
    'img': 'solona.png',
    'value': '\$390.00',
    'changeRate': '2.21%',
    'isIncreased': false,
  },
};

List<ChartData> data = [
  ChartData(10, 2018),
  ChartData(25, 2019),
  ChartData(20, 2020),
  ChartData(60, 2021),
  ChartData(50, 2022),
];
