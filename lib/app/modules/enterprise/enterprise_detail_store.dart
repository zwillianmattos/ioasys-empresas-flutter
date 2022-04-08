import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/utils/api_response.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/models/enterprise_model.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/repositories/enterprise_repository.dart';
import 'package:mobx/mobx.dart';

part 'enterprise_detail_store.g.dart';

class EnterpriseDetailStore = _EnterpriseDetailBase with _$EnterpriseDetailStore;

abstract class _EnterpriseDetailBase with Store {
  final EnterpriseRepository repository;

  @observable
  bool isLoading = false;

  @observable
  EnterpriseModel? enterprise;

  _EnterpriseDetailBase(this.repository) {
    details();
  }

  @action
  details() async {
    try {
      isLoading = true;

      print(Modular.args.params);
      String id = Modular.args.params['id'];
      ApiResponse? response = await repository.detail(id);
      if (response != null) {
        enterprise = response.data as EnterpriseModel;
      }
      print(response?.data);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }
}
