import 'package:cafe_app/main.dart';
import 'package:cafe_app/pages/tables/table_page.dart';
import 'package:cafe_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/table', child: (context, args) => TablePage()),
        ModularRouter('/main', child: (context, args) => MainPage()),
        ModularRouter(
          '/token/:token',
          child: (_, args) => MainPage(token: args.params['token']),
        ),
      ];

  @override
  Widget get bootstrap => App();
}
