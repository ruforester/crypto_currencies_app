import '../features/coin/coin.dart';
import '../features/coins_list/coins_list.dart';

final routes = {
  '/': (context) => const CoinsListScreen(),
  '/coin': (context) => const CoinScreen(),
};
