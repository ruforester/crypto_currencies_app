import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        dividerTheme: const DividerThemeData(
          color: Colors.white24,
          indent: 20,
          endIndent: 20,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/coin': (context) => const CryptoCoinScreen(),
      },
      // home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const coinName = 'Bitcoin';
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Currencies List')),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (ctx, i) => ListTile(
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
            '\$ 40000',
            style: theme.textTheme.labelLarge,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushNamed('/coin', arguments: coinName);
          },
        ),
      ),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({
    super.key,
  });

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      return;
    }
    if (args is! String) {
      return;
    }
    setState(() {
      coinName = args;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
      ),
    );
  }
}
