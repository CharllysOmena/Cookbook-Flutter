import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/states/firebase_login_state.dart';
import '../../interactor/stores/login_store.dart';
import '../widgets/form_login.dart';
import '../widgets/loading.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  LoginStore store = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return (store.state is LoadingFirebaseLoginState)
              ? const Loading()
              : FormLogin(store: store);
        },
      ),
    );
  }
}
