import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/utils/api_response.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/model/investor_model.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/model/sign_in_model.dart';

class SignInRepository extends Disposable {
  final Dio http;

  SignInRepository(this.http);

  Future<ApiResponse?> signIn(SignInModel signInModel) async {
    try {
      final response =
          await http.post("users/auth/sign_in", data: signInModel.toJson());
      print(response.realUri);
      print(response.data);

      InvestorModel investorModel =
          InvestorModel.fromJson(response.data['investor']);

      return ApiResponse(
        success: true,
        data: investorModel,
        headers: response.headers,
      );
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);

        return ApiResponse(
          success: false,
          errors: e.response!.data['errors'].cast<String>(),
        );
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions.data);
        print(e.message);
        return ApiResponse(
          success: false,
          errors: ["Não foi possível realizar a requisição"],
        );
      }
    }
  }

  @override
  void dispose() {}
}
