// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerImc on Controller, Store {
  late final _$imcListAtom = Atom(name: 'Controller.imcList', context: context);

  @override
  List<Pessoa> get imcList {
    _$imcListAtom.reportRead();
    return super.imcList;
  }

  @override
  set imcList(List<Pessoa> value) {
    _$imcListAtom.reportWrite(value, super.imcList, () {
      super.imcList = value;
    });
  }

  late final _$calcularImcAsyncAction =
      AsyncAction('Controller.calcularImc', context: context);

  @override
  Future calcularImc(String nome, double peso, double altura) {
    return _$calcularImcAsyncAction
        .run(() => super.calcularImc(nome, peso, altura));
  }

  late final _$showListAsyncAction =
      AsyncAction('Controller.showList', context: context);

  @override
  Future<void> showList() {
    return _$showListAsyncAction.run(() => super.showList());
  }

  late final _$deleteAsyncAction =
      AsyncAction('Controller.delete', context: context);

  @override
  Future delete(Pessoa pessoa) {
    return _$deleteAsyncAction.run(() => super.delete(pessoa));
  }

  @override
  String toString() {
    return '''
imcList: ${imcList}
    ''';
  }
}
