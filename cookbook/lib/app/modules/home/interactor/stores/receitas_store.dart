import 'package:cookbook/app/modules/home/data/models/receita.dart';
import 'package:cookbook/app/modules/home/data/repositories/receitas_respository.dart';
import 'package:cookbook/app/modules/home/interactor/states/receita_state.dart';
import 'package:mobx/mobx.dart';

part 'receitas_store.g.dart';

class ReceitasStore = _ReceitasStoreBase with _$ReceitasStore;

abstract class _ReceitasStoreBase with Store {
  final IReceitasRepository receitasRepository;

  _ReceitasStoreBase({required this.receitasRepository});

  @observable
  ReceitaState state = const StartReceitaState();

  List<Receita>? receitas;

  @action
  Future getReceitas(String id) async {
    state = const LoadingReceitaState();
    var response = await receitasRepository.get(id);
    (response is SuccessReceitaState) ? receitas = response.receitas : null;
    state = response;
  }
}
