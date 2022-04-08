import 'package:dio/dio.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/model/investor_model.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  InvestorModel? investorModel;

  @observable
  dynamic? headers;

  @action
  void storeUser(InvestorModel investorModel, dynamic headers) {
    this.investorModel = investorModel;
    this.headers = headers;
  }

  clearStore(){
    this.investorModel = null;
    this.headers = null;
  }

  @computed
  get investor => investorModel;

  Options? get authHeader {
    if (this.headers == null) {
      return null;
    }
    return Options(headers: {
      'access-token': this.headers['access-token'].first,
      'client': this.headers['client'].first,
      'uid': this.headers['uid'].first,
    });
    
  }
}
