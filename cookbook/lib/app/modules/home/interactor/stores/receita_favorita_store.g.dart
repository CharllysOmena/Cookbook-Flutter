// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receita_favorita_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReceitaFavoritaStore on _ReceitaFavoritaStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_ReceitaFavoritaStoreBase.state', context: context);

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

  late final _$getReceitaAsyncAction =
      AsyncAction('_ReceitaFavoritaStoreBase.getReceita', context: context);

  @override
  Future<dynamic> getReceita(String id) {
    return _$getReceitaAsyncAction.run(() => super.getReceita(id));
  }

  late final _$desfazerFavoritoAsyncAction = AsyncAction(
      '_ReceitaFavoritaStoreBase.desfazerFavorito',
      context: context);

  @override
  Future<dynamic> desfazerFavorito(String id) {
    return _$desfazerFavoritoAsyncAction.run(() => super.desfazerFavorito(id));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
