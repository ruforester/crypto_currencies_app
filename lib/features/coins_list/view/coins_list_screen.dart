import 'package:crypto_currencies_app/features/coins_list/widgets/widgets.dart';
import 'package:crypto_currencies_app/repositories/coins_repository/abstract_coins_repository.dart';
import 'package:crypto_currencies_app/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_currencies_app/repositories/coins_repository/model/coin.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CoinsListScreen extends StatefulWidget {
  const CoinsListScreen({
    super.key,
  });

  @override
  State<CoinsListScreen> createState() => _CoinsListScreenState();
}

class _CoinsListScreenState extends State<CoinsListScreen> {
  List<CoinModel>? _coinsList;

  @override
  void initState() {
    _loadCoinsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Currencies List')),
      body: _coinsList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: _coinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (ctx, i) => Coin(
                coin: _coinsList![i],
              ),
            ),
    );
  }

  void _loadCoinsList() async {
    _coinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
