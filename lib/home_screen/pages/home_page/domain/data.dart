import 'package:nft_wallet/home_screen/pages/home_page/domain/chart_data_model.dart';
import 'package:nft_wallet/home_screen/pages/home_page/domain/nft_model.dart';
import 'package:nft_wallet/home_screen/pages/home_page/domain/token_model.dart';

List<Token> tokensList = [
  Token(
    id: 0,
    shortForm: 'BTC',
    fullForm: 'Bitcoin',
    img: 'bitcoin.png',
    value: 36590.00,
    changeRate: 6.21,
    isProfit: true,
  ),
  Token(
    id: 1,
    shortForm: 'ETH',
    fullForm: 'Ethereum',
    img: 'ethereum.png',
    value: 2950.00,
    changeRate: 5.21,
    isProfit: false,
  ),
  Token(
    id: 2,
    shortForm: 'SOL',
    fullForm: 'Solona',
    img: 'solona.png',
    value: 390.00,
    changeRate: 2.21,
    isProfit: false,
  ),
];

List<NFT> nftsList = [
  NFT(
    id: 1957,
    club: 'Bored Ape Yacht Club',
    img: 'avatar1.png',
    value: 6.64,
    changeRate: 23114.57,
    isProfit: true,
  ),
  NFT(
    id: 6513,
    club: 'Bored Ape Yacht Club',
    img: 'avatar2.png',
    value: 199.8,
    changeRate: 45114.57,
    isProfit: true,
  ),
  NFT(
    id: 1957,
    club: 'Bored Ape Yacht Club',
    img: 'avatar1.png',
    value: 6.64,
    changeRate: 23114.57,
    isProfit: true,
  ),
  NFT(
    id: 6513,
    club: 'Bored Ape Yacht Club',
    img: 'avatar2.png',
    value: 199.8,
    changeRate: 45114.57,
    isProfit: true,
  ),
];

List<ChartData> data = [
  ChartData(10, 2018),
  ChartData(25, 2019),
  ChartData(20, 2020),
  ChartData(60, 2021),
  ChartData(50, 2022),
];
