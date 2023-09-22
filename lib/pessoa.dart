// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class Pessoa {
  String? nome;

  double resultado;
  String? classificacao;
  Pessoa({
    this.nome,
    this.resultado = 0,
    this.classificacao,
  });

  calculadora(double p, double a) {
    resultado = p / (pow(a, 2));
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
