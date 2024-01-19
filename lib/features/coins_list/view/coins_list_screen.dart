import 'package:crypto_currencies_app/features/coins_list/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CoinsListScreen extends StatelessWidget {
  const CoinsListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const coinName = 'Bitcoin';
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Currencies List')),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (ctx, i) => const Coin(coinName: coinName),
      ),
    );
  }
}
