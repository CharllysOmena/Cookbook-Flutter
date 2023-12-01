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

  late final _$isFavoriteAtom =
      Atom(name: '_ReceitasStoreBase.isFavorite', context: context);

  @override
  bool? get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool? value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$getReceitaAsyncAction =
      AsyncAction('_ReceitasStoreBase.getReceita', context: context);

  @override
  Future<dynamic> getReceita(String id) {
    return _$getReceitaAsyncAction.run(() => super.getReceita(id));
  }

  late final _$favoritarReceitaAsyncAction =
      AsyncAction('_ReceitasStoreBase.favoritarReceita', context: context);

  @override
  Future<dynamic> favoritarReceita(Receita receita) {
    return _$favoritarReceitaAsyncAction
        .run(() => super.favoritarReceita(receita));
  }

  late final _$verificaReceitaFavoritaAsyncAction = AsyncAction(
      '_ReceitasStoreBase.verificaReceitaFavorita',
      context: context);

  @override
  Future<dynamic> verificaReceitaFavorita(String id) {
    return _$verificaReceitaFavoritaAsyncAction
        .run(() => super.verificaReceitaFavorita(id));
  }

  late final _$desfazerFavoritoAsyncAction =
      AsyncAction('_ReceitasStoreBase.desfazerFavorito', context: context);

  @override
  Future<dynamic> desfazerFavorito(String id) {
    return _$desfazerFavoritoAsyncAction.run(() => super.desfazerFavorito(id));
  }

  @override
  String toString() {
    return '''
state: ${state},
isFavorite: ${isFavorite}
    ''';
  }
}
