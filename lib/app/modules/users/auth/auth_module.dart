import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/store/auth_store.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/repositories/sign_in_repository.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/sign_in_store.dart';

import 'sign_in/sign_in_page.dart';

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
