import 'package:cookbook/app/modules/home/data/models/comida.dart';
import 'package:cookbook/app/modules/home/data/repositories/comidas_repository.dart';
import 'package:cookbook/app/modules/home/interactor/states/comida_state.dart';
import 'package:mobx/mobx.dart';

part 'comidas_store.g.dart';

class ComidasStore = _ComidasStoreBase with _$ComidasStore;

abstract class _ComidasStoreBase with Store {
  final IComidasRepository comidasRepository;

  _ComidasStoreBase({required this.comidasRepository});

  @observable
  ComidaState state = const StartComidaState();

  List<Comida>? comidas;

  Future getComidas(String categoria) async {
    state = const LoadingComidaState();
    var response = await comidasRepository.get(categoria);
    (response is SuccessComidaState) ? comidas = response.comidas : null;
    state = response;
  }
}
