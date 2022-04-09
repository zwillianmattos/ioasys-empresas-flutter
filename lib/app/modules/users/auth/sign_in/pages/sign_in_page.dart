import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/utils/validations.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/app_bar.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/app_scaffold_custom.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/button_rounded.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/forms.dart';

import 'sign_in_store.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ModularState<SignInPage, SignInStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AppScaffoldCustom(
          isLoading: controller.isLoadingForm,
          body: [
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Digite seus dados para continuar.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    AppTextFormField(
                      "E-mail",
                      initialValue: controller.signInModel.email,
                      onSaved: (String? value) {
                        controller.signInModel.email = value;
                      },
                      onValidation: EmailValidator.valdiate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    AppTextFormField(
                      "Senha",
                      initialValue: controller.signInModel.password,
                      onSaved: (String? value) {
                        controller.signInModel.password = value;
                      },
                      showPassword: true,
                      isPassword: true,
                      onValidation: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório";
                        }
                        return null;
                      },
                    ),
                    if (controller.errors.isNotEmpty)
                      SizedBox(
                        height: 16,
                      ),
                    if (controller.errors.isNotEmpty)
                      ...controller.errors
                          .map((element) => Text(
                                element,
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                              ))
                          .toList(),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonRounded(
                      "Entrar",
                      onPressed: () {
                        controller.auth();
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
          appBar: AppBarCustom(
            title: RichText(
              text: TextSpan(
                text: 'Boas vindas, \n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: "Você está no Empresas.",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16, fontFamily: 'Gilroy Light')),
                ],
              ),
            ),
          ));
    });
  }
}
