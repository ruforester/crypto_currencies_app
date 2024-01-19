import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CryptoListApp extends StatelessWidget {
  const CryptoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      routes: routes,
      // home: const HomeScreen(),
    );
  }
}
