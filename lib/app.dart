import 'package:flutter/material.dart';
import 'package:pokedex/app_router.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: AppRouter().router,
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
    );
  }
}
