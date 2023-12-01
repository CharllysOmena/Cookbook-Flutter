import 'package:cookbook/app/modules/home/data/models/receita.dart';
import 'package:cookbook/app/modules/home/data/services/firebase_receita_favorita_service.dart';
import 'package:cookbook/app/modules/home/interactor/states/firebase_receita_favorita_state.dart';
import 'package:mobx/mobx.dart';

part 'favoritos_store.g.dart';

class FavoritosStore = _FavoritosStoreBase with _$FavoritosStore;

abstract class _FavoritosStoreBase with Store {
  final IFirebaseReceitaFavoritaService firebaseReceitaFavoritaService;

  _FavoritosStoreBase({required this.firebaseReceitaFavoritaService});

  @observable
  FirebaseReceitaFavoritaState state =
      const StartFirebaseReceitaFavoritaState();

  List<Receita>? comidas;

  @action
  Future getReceitasFavoritas() async {
    state = const LoadingFirebaseReceitaFavoritaState();
    var response = await firebaseReceitaFavoritaService.get();
    (response is SuccessGetFirebaseReceitaFavoritaState)
        ? comidas = response.receitas
        : null;
    state = response;
  }
}
