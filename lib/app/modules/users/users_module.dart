import 'package:flutter_modular/flutter_modular.dart';

import 'auth/auth_module.dart';

class UsersModule extends Module {
  final List<Bind> binds = [
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/auth',  module: AuthModule()),
  ];
}
