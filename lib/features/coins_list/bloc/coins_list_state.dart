part of 'coins_list_bloc.dart';

abstract class CoinsListState extends Equatable {}

class CoinsListInitial extends CoinsListState {
  @override
  List<Object?> get props => [];
}

class CoinsListLoading extends CoinsListState {
  @override
  List<Object?> get props => [];
}

class CoinsListLoaded extends CoinsListState {
  CoinsListLoaded({required this.coinsList});
  final List<CoinModel> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class CoinsListLoadingFailure extends CoinsListState {
  CoinsListLoadingFailure({required this.exception});
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
