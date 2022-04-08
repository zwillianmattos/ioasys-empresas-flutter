import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/store/auth_store.dart';
import 'package:ioasys_empresas_flutter/app/core/utils/api_response.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/model/sign_in_model.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/repositories/sign_in_repository.dart';
import 'package:mobx/mobx.dart';

import 'model/investor_model.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  final SignInRepository repository;

  final formKey = GlobalKey<FormState>();

  @observable
  SignInModel signInModel = SignInModel(
    email: 'testeapple@ioasys.com.br',
    password: '12341234',
  );

  @observable
  ObservableList<String> errors = ObservableList<String>();

  @observable
  bool isLoading = false;

  _SignInStoreBase(this.repository) {}

  Future<dynamic> auth() async {
    try {
      isLoading = true;
      
      if (!formKey.currentState!.validate()) {
        throw ("Erro ao validar formulario");
      }

      formKey.currentState!.save();

      ApiResponse? response = await repository.signIn(signInModel);

      if (response != null) {
        if (response.success! && response.data != null) {
          Modular.get<AuthStore>()
              .storeUser(response.data as InvestorModel, response.headers);
          Modular.to.pushReplacementNamed('/enterprise/');
          isLoading = false;
        } else {
          errors.clear();
          errors.addAll(response.errors!);
          isLoading = false;
        }
      }
    } catch (e) {
      print(e);
      isLoading = false;
    }
  }
}
