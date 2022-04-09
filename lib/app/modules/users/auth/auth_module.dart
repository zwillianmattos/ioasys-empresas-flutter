import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/repositories/sign_in_repository.dart';

import 'sign_in/pages/sign_in_page.dart';
import 'sign_in/pages/sign_in_store.dart';
class AuthModule extends Module {
  final List<Bind> binds = [
    BindInject(
      (i) => SignInRepository(i<Dio>()),
    ),
    BindInject(
      (i) => SignInStore(i<SignInRepository>()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/sign_in', child: (_, __) => SignInPage()),
  ];
}
