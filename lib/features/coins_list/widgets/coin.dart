import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Coin extends StatelessWidget {
  const Coin({
    super.key,
    required this.coinName,
    required this.coinPrice,
  });

  final String coinName;
  final double coinPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin.svg',
        height: 25,
        width: 25,
      ),
      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '\$ $coinPrice',
        style: theme.textTheme.labelLarge,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coinName);
      },
    );
  }
}
