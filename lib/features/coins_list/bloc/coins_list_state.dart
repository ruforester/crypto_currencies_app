part of 'coins_list_bloc.dart';

class CoinsListState {}

class CoinsListInitial extends CoinsListState {}

class CoinsListLoading extends CoinsListState {}

class CoinsListLoaded extends CoinsListState {
  CoinsListLoaded({required this.coinsList});
  final List<CoinModel> coinsList;
}

class CoinsListLoadingFailure extends CoinsListState {
  CoinsListLoadingFailure({required this.exception});
  final Object? exception;
}
