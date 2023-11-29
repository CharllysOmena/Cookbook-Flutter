// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorias_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriasStore on _CategoriasStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_CategoriasStoreBase.state', context: context);

  @override
  CategoriaState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CategoriaState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getCategoriasAsyncAction =
      AsyncAction('_CategoriasStoreBase.getCategorias', context: context);

  @override
  Future<dynamic> getCategorias() {
    return _$getCategoriasAsyncAction.run(() => super.getCategorias());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
