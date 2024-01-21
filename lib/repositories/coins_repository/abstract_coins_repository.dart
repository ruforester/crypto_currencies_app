import 'package:crypto_currencies_app/repositories/coins_repository/model/coin.dart';

abstract class AbstractCoinsRepository {
  Future<List<CoinModel>> getCoinsList();
}
