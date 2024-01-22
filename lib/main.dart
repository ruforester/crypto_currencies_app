import 'package:crypto_currencies_app/repositories/coins_repository/abstract_coins_repository.dart';
import 'package:crypto_currencies_app/repositories/coins_repository/coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_list_app.dart';

void main() {
  final talker = TalkerFlutter.init();

  GetIt.I.registerSingleton(talker);
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CoinsRepository(dio: Dio()));
  runApp(const CryptoListApp());
}
