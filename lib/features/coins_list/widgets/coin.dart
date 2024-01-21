import 'package:crypto_currencies_app/repositories/coins_repository/model/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Coin extends StatelessWidget {
  const Coin({
    super.key,
    required this.coin,
  });

  final CoinModel coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(
        coin.imageURL,
        height: 30,
        width: 30,
      ),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '\$ ${coin.priceUSD.toStringAsFixed(2)}',
        style: theme.textTheme.labelLarge,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin.name);
      },
    );
  }
}
