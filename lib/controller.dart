// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:imc_flutter_dio/pessoa.dart';

class ControllerImc {
  final Pessoa pessoa;
  final List<Pessoa> imcList = [];
  ControllerImc({
    required this.pessoa,
  });

  void calcularImc(String nome, double peso, double altura) {
    pessoa.calculadora(peso, altura);
    imcList.add(
      Pessoa(
        nome: nome,
        classificacao: pessoa.classificacao,
      ),
    );
  }
}
