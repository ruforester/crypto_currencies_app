import 'package:crypto_currencies_app/features/coins_list/bloc/coins_list_bloc.dart';
import 'package:crypto_currencies_app/features/coins_list/widgets/widgets.dart';
import 'package:crypto_currencies_app/repositories/coins_repository/abstract_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CoinsListScreen extends StatefulWidget {
  const CoinsListScreen({
    super.key,
  });

  @override
  State<CoinsListScreen> createState() => _CoinsListScreenState();
}

class _CoinsListScreenState extends State<CoinsListScreen> {
  final _coinsListBloc = CoinsListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _coinsListBloc.add(LoadCoinsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
        actions: [
          IconButton(
              onPressed: () {
                _coinsListBloc.add(LoadCoinsList());
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: BlocBuilder<CoinsListBloc, CoinsListState>(
        bloc: _coinsListBloc,
        builder: (context, state) {
          if (state is CoinsListLoaded) {
            return ListView.separated(
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (ctx, i) => Coin(
                coin: state.coinsList[i],
              ),
            );
          }
          if (state is CoinsListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Something went wrong.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      _coinsListBloc.add(LoadCoinsList());
                    },
                    child: Text(
                      'Try again',
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
              // child: Text(state.exception?.toString() ?? 'Error'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
