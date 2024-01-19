import 'package:crypto_currencies_app/features/coins_list/widgets/widgets.dart';
import 'package:crypto_currencies_app/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_currencies_app/repositories/coins_repository/model/coin.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Currencies List')),
      body: _coinsList == null
          ? const SizedBox()
          : ListView.separated(
              itemCount: _coinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (ctx, i) => Coin(coinName: _coinsList![i].name),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _coinsList = await CoinsRepository().getCoinsList();
          setState(() {});
        },
      ),
    );
  }
}
