import 'package:cookbook/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/login/data/guards/firebase_guard_service.dart';
import 'modules/login/data/services/firebase_login_service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule(), guards: [
      FirebaseGuardService(firebaseLoginService: FirebaseLoginService())
    ]),
    ModuleRoute("/login", module: LoginModule()),
  ];
}
