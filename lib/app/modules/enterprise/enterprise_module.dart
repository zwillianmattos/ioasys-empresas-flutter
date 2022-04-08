import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/enterprise_page.dart';

class EnterpriseModule extends Module {
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => EnterprisePage()),
  ];
}
