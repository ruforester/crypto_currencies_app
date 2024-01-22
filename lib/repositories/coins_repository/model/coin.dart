import 'package:equatable/equatable.dart';

class CoinModel extends Equatable {
  final String name;
  final double priceUSD;
  final String imageURL;

  const CoinModel({
    required this.name,
    required this.priceUSD,
    required this.imageURL,
  });

  @override
  List<Object?> get props => [
        name,
        priceUSD,
        imageURL,
      ];
}
