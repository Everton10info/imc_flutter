import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imc_flutter_dio/controller.dart';
import 'package:imc_flutter_dio/pessoa.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(PessoaAdapter());
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
                controller: ControllerImc(),
              ),
        });
  }
}
