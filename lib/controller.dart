// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:imc_flutter_dio/data/hive/hive_db.dart';
import 'package:imc_flutter_dio/pessoa.dart';
part 'controller.g.dart';

class ControllerImc = Controller with _$ControllerImc;

abstract class Controller with Store {
  @observable
  List<Pessoa> imcList = [];

  @action
  calcularImc(String nome, double peso, double altura) async {
    final pessoa = Pessoa();
    pessoa.calculadora(peso, altura);
    final db = await HiveDb.load();
    db.save(Pessoa(
      nome: nome,
      classificacao: pessoa.classificacao,
    ));
  }

  @action
  Future<void> showList() async {
    final db = await HiveDb.load();
    imcList = db.getPessoas();
  }

  @action
  Future<void> delete(Pessoa pessoa) async {
    final db = await HiveDb.load();
    db.delete(pessoa);
    imcList = db.getPessoas();
  }
}
