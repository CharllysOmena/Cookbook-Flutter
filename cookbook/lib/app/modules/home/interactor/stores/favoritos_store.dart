import 'package:cookbook/app/modules/home/data/models/receita.dart';
import 'package:cookbook/app/modules/home/data/services/firebase_receita_favorita_service.dart';
import 'package:mobx/mobx.dart';

part 'favoritos_store.g.dart';

class FavoritosStore = _FavoritosStoreBase with _$FavoritosStore;

abstract class _FavoritosStoreBase with Store {
  final IFirebaseReceitaFavoritaService firebaseReceitaFavoritaService;

  _FavoritosStoreBase({required this.firebaseReceitaFavoritaService});

  List<Receita>? comidas;

  Stream<List<Receita>> getReceitasFavoritas() =>
      firebaseReceitaFavoritaService.get();
}
