import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/repositories/enterprise_repository.dart';

import 'pages/detail/enterprise_detail_page.dart';
import 'pages/detail/enterprise_detail_store.dart';
import 'pages/home/enterprise_page.dart';
import 'pages/home/enterprise_store.dart';

class EnterpriseModule extends Module {
  final List<Bind> binds = [
    BindInject((i) => EnterpriseRepository(i<Dio>())),
    BindInject((i) => EnterpriseDetailStore(i<EnterpriseRepository>())),
    BindInject((i) => EnterpriseStore(i<EnterpriseRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => EnterprisePage()),
    ChildRoute('/details/:id', child: (_, __) => EnterpriseDetailPage()),
  ];
}
