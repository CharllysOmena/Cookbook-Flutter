import 'package:cookbook/app/modules/home/data/datasources/comidas_datasource.dart';
import 'package:cookbook/app/modules/home/data/datasources/receitas_datasource.dart';
import 'package:cookbook/app/modules/home/data/repositories/comidas_repository.dart';
import 'package:cookbook/app/modules/home/data/repositories/receitas_respository.dart';
import 'package:cookbook/app/modules/home/interactor/stores/receitas_store.dart';
import 'package:cookbook/app/modules/home/interactor/stores/comidas_store.dart';
import 'package:cookbook/app/modules/home/data/datasources/categorias_datasource.dart';
import 'package:cookbook/app/modules/home/data/repositories/categoria_respository.dart';
import 'package:cookbook/app/modules/home/interactor/stores/categorias_store.dart';
import 'package:cookbook/app/modules/home/interactor/stores/favoritos_store.dart';
import 'package:cookbook/app/modules/home/ui/pages/comidas_page.dart';
import 'package:cookbook/app/modules/home/ui/pages/receitas_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../login/data/services/firebase_login_service.dart';
import 'interactor/stores/home_store.dart';
import 'ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton((i) => ReceitasDatasource(dio: i.get())),
    Bind.lazySingleton((i) => ReceitasRepository(receitasDatasource: i.get())),
    Bind.lazySingleton((i) => ComidasDatasource(dio: i.get())),
    Bind.lazySingleton((i) => ComidasRepository(comidasDatasource: i.get())),
    Bind.lazySingleton((i) => CategoriaDatasoruce(dio: i.get())),
    Bind.lazySingleton(
        (i) => CategoriaRepository(categoriaDatasource: i.get())),
    Bind.lazySingleton((i) => ReceitasStore(receitasRepository: i.get())),
    Bind.lazySingleton((i) => ComidasStore(comidasRepository: i.get())),
    Bind.lazySingleton((i) => CategoriasStore(categoriaRepository: i.get())),
    Bind.lazySingleton((i) => FavoritosStore()),
    Bind.lazySingleton((i) => FirebaseLoginService()),
    Bind.lazySingleton((i) => HomeStore(firebaseLoginService: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute("/comidas", child: (_, args) => const ComidasPage()),
    ChildRoute("/receitas", child: (_, args) => const ReceitasPage()),
  ];
}
