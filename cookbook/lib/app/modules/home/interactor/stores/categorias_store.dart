import 'package:cookbook/app/modules/home/data/models/categoria.dart';
import 'package:cookbook/app/modules/home/data/repositories/categoria_respository.dart';
import 'package:cookbook/app/modules/home/interactor/states/categoria_state.dart';
import 'package:mobx/mobx.dart';

part 'categorias_store.g.dart';

class CategoriasStore = _CategoriasStoreBase with _$CategoriasStore;

abstract class _CategoriasStoreBase with Store {
  final ICategoriaRepository categoriaRepository;

  _CategoriasStoreBase({required this.categoriaRepository});

  @observable
  CategoriaState state = const StartCategoriaState();

  List<Categoria>? categorias;

  @action
  Future getCategorias() async {
    state = const LoadingCategoriaState();
    var response = await categoriaRepository.get();
    (response is SuccessCategoriaState)
        ? categorias = response.categorias
        : null;
    state = response;
  }
}
