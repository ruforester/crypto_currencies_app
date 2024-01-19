import 'package:dio/dio.dart';

import 'model/coin.dart';

class CoinsRepository {
  final url =
      'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,SOL,XRP,LINK,ARB,&tsyms=USD';

  Future<List<CoinModel>> getCoinsList() async {
    final response = await Dio().get(url);
    final data = response.data as Map<String, dynamic>;
    final coinsList = data.entries
        .map(
          (e) => CoinModel(
            name: e.key,
            priceUSD: (e.value as Map<String, dynamic>)['USD'],
          ),
        )
        .toList();

    return coinsList;
  }
}
