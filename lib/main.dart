// import 'dart:async';

import 'package:crypto_currencies_app/repositories/coins_repository/abstract_coins_repository.dart';
import 'package:crypto_currencies_app/repositories/coins_repository/coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:talker_dio_logger/talker_dio_logger.dart';
// import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
// import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_list_app.dart';

void main() {
  // final talker = TalkerFlutter.init();

  // GetIt.I.registerSingleton(talker);

  final dio = Dio();
  // dio.interceptors.add(
  //   TalkerDioLogger(talker: talker),
  // );

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CoinsRepository(dio: dio));

  // FlutterError.onError =
  //     (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  // runZonedGuarded(() => runApp(const CryptoListApp()), (error, stack) {
  //   GetIt.I<Talker>().handle(error, stack);
  // });
  runApp(const CryptoListApp());
}
