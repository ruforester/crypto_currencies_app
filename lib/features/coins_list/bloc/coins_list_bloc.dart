import 'package:flutter_bloc/flutter_bloc.dart';
part 'coins_list_event.dart';
part 'coins_list_state.dart';

class CoinsListBloc extends Bloc<CoinsListEvent, CoinsListState> {
  CoinsListBloc() : super(CoinsListInitial()) {
    on<CoinsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
