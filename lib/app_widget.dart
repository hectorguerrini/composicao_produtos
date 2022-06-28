import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Composition',
      theme: ThemeData.dark(),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      scaffoldMessengerKey: scaffoldKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
