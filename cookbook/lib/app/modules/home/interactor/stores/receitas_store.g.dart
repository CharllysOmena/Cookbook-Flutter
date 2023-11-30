// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receitas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReceitasStore on _ReceitasStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_ReceitasStoreBase.state', context: context);

  @override
  ReceitaState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ReceitaState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getReceitasAsyncAction =
      AsyncAction('_ReceitasStoreBase.getReceitas', context: context);

  @override
  Future<dynamic> getReceitas(String id) {
    return _$getReceitasAsyncAction.run(() => super.getReceitas(id));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
