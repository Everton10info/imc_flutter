import 'dart:math';
import 'package:hive/hive.dart';
part 'pessoa.g.dart';

@HiveType(typeId: 1)
class Pessoa extends HiveObject {
  @HiveField(0)
  String? nome;

  @HiveField(1)
  String? classificacao;

  Pessoa({
    this.nome,
    this.classificacao,
  });

  calculadora(double p, double a) {
    final resultado = p / (pow(a, 2));
    switch (resultado) {
      case >= 40:
        classificacao =
            '${resultado.toStringAsFixed(2)} kg, obesidade grau 3 (Mórbida)! ';
        break;
      case > 35:
        classificacao =
            '${resultado.toStringAsFixed(2)} kg, obesidade grau 2 (Severa)! ';
      case > 30:
        classificacao = '${resultado.toStringAsFixed(2)} kg, obesidade grau 1';
        break;
      case > 25:
        classificacao = '${resultado.toStringAsFixed(2)} kg, sobrepeso';
        break;
      case > 18.5:
        classificacao = '${resultado.toStringAsFixed(2)} kg, saudável';
        break;
      case > 17:
        classificacao = '${resultado.toStringAsFixed(2)} kg, magresa leve';
        break;
      case > 16:
        classificacao = '${resultado.toStringAsFixed(2)} kg, magresa moderada';
        break;
      case < 16:
        classificacao = '${resultado.toStringAsFixed(2)}kg, magresa grave';
        break;
    }
    return '';
  }
}
