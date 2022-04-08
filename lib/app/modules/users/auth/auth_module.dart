import 'package:flutter_modular/flutter_modular.dart';

import 'sign_in/sign_in_page.dart';

class AuthModule extends Module {
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/sign_in', child: (_, __) => SignInPage()),
  ];
}
