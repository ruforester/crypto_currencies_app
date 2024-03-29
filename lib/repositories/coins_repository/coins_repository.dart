import 'package:crypto_currencies_app/repositories/coins_repository/abstract_coins_repository.dart';
import 'package:dio/dio.dart';

import 'model/coin.dart';

class CoinsRepository implements AbstractCoinsRepository {
  final url =
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,SOL,XRP,LINK,ARB,&tsyms=USD';
  final Dio dio;

  CoinsRepository({required this.dio});

  @override
  Future<List<CoinModel>> getCoinsList() async {
    final response = await Dio().get(url);
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinsList = dataRaw.entries.map(
      (e) {
        final usdData = e.value['USD'] as Map<String, dynamic>;
        return CoinModel(
          name: e.key,
          priceUSD: usdData['PRICE'],
          imageURL: 'https://www.cryptocompare.com${usdData['IMAGEURL']}',
        );
      },
    ).toList();

    return coinsList;
  }
}
