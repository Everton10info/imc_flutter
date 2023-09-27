import 'package:hive/hive.dart';
import 'package:imc_flutter_dio/pessoa.dart';

class HiveDb {
  static late Box _box;

  HiveDb._create();

  static Future<HiveDb> load() async {
    if (Hive.isBoxOpen('imc')) {
      _box = Hive.box('imc');
    } else {
      _box = await Hive.openBox('imc');
    }
    return HiveDb._create();
  }

  void save(Pessoa pessoa) async {
    _box.add(pessoa);
  }

  delete(Pessoa pessoa) {
    pessoa.delete();
  }

  List<Pessoa> getPessoas() {
    return _box.values.cast<Pessoa>().toList();
  }
}
