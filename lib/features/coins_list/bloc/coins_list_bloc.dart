import 'package:crypto_currencies_app/repositories/coins_repository/abstract_coins_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/coins_repository/model/coin.dart';
part 'coins_list_event.dart';
part 'coins_list_state.dart';

class CoinsListBloc extends Bloc<CoinsListEvent, CoinsListState> {
  final AbstractCoinsRepository coinsRepository;

  CoinsListBloc(this.coinsRepository) : super(CoinsListInitial()) {
    on<LoadCoinsList>((event, emit) async {
      try {
        emit(CoinsListLoading());
        final coinsList = await coinsRepository.getCoinsList();
        emit(CoinsListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CoinsListLoadingFailure(exception: e));
      }
    });
  }
}
