import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/users_module.dart';
import 'core/constants/env.dart';
import 'core/store/auth_store.dart';
import 'modules/enterprise/enterprise_module.dart';
import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  final List<Bind> binds = [
    BindInject(
      (i) => Dio(
        BaseOptions(
          baseUrl: API_ENDPOINT,
        ),
      ),
    ),
    BindInject((i) => AuthStore(), isSingleton: true, isLazy: false),
    BindInject((i) => SplashPage()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashPage()),
    ModuleRoute('/enterprise', module: EnterpriseModule()),
    ModuleRoute('/users', module: UsersModule()),
  ];
}
