import 'package:cafe_app/routes/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';
import 'providers/menu.dart';
import 'providers/table.dart';

void main() {
  // runApp(App());
  runApp(ModularApp(module: AppModule()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => TableProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Cafe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
        ),
        // routes: {
        //   '/start': (context) => StartPage(),
        //   '/main': (context) => MainPage(),
        //   '/table': (context) => TablesBody(),
        // },
        initialRoute: '/table',
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
