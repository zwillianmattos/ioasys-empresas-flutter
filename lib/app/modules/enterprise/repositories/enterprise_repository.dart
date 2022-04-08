import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/store/auth_store.dart';
import 'package:ioasys_empresas_flutter/app/core/utils/api_response.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/models/enterprise_model.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/model/investor_model.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/model/sign_in_model.dart';

class EnterpriseRepository extends Disposable {
  final Dio http;

  EnterpriseRepository(this.http);

  Future<ApiResponse?> detail(String id) async {
    try {
      final response = await http.get("enterprises/$id",
          options: Modular.get<AuthStore>().authHeader);
      if (response != null) {

        return ApiResponse(
          success: true,
          data: EnterpriseModel.fromJson(response.data['enterprise']),
          headers: response.headers,
        );
      }
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

  Future<ApiResponse?> search(String query) async {
    try {
      final response = await http.get("enterprises?name=${query}",
          options: Modular.get<AuthStore>().authHeader);
      if (response != null) {
        List<dynamic> data = response.data['enterprises'];
        List<EnterpriseModel>? enterprises =
            data.map((e) => EnterpriseModel.fromJson(e)).toList();

        return ApiResponse(
          success: true,
          data: enterprises,
          headers: response.headers,
        );
      }
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
