import 'package:flutter/material.dart';
import 'package:imc_flutter_dio/controller.dart';
import 'package:imc_flutter_dio/pessoa.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(
                controller: ControllerImc(pessoa: Pessoa()),
              ),
        });
  }
}
