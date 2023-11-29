import 'package:cookbook/app/modules/login/ui/pages/cadastro_page.dart';
import 'package:cookbook/app/modules/login/ui/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/services/firebase_cadastro_service.dart';
import 'data/services/firebase_login_service.dart';
import 'interactor/stores/cadastro_store.dart';
import 'interactor/stores/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FirebaseLoginService()),
    Bind.lazySingleton((i) => LoginStore(firebaseLoginService: i.get())),
    Bind.lazySingleton((i) => FirebaseCadastroService()),
    Bind.lazySingleton((i) => CadastroStore(firebaseCadastroService: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute("/cadastro", child: (_, args) => CadastroPage()),
  ];
}
