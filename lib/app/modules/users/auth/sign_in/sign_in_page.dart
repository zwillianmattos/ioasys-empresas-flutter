import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/utils/validations.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/forms.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/sign_in_store.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ModularState<SignInPage, SignInStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                pinned: false,
                floating: false,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          "assets/images/background.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: -50,
                        child: Container(
                          child: Center(
                            child: Image.asset(
                              "assets/images/logo-markdown.png",
                              scale: 1,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [
                              0,
                              0.1,
                              0.3,
                              1,
                            ],
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                              Colors.black.withOpacity(0.2),
                              Colors.black.withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                                fontWeight: FontWeight.normal, fontSize: 16)),
                      ],
                    ),
                  ),
                  titlePadding:
                      EdgeInsets.only(left: 16, right: 20, bottom: 34),
                ),
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
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
                          ),
                          SizedBox(height: 16),
                          AppTextFormField(
                            "Senha",
                            initialValue: controller.signInModel.password,
                            onSaved: (String? value) {
                              controller.signInModel.password = value;
                            },
                            isPassword: true,
                          ),
                          if (controller.errors.isNotEmpty)
                          SizedBox(
                            height: 16,
                          ),
                          if (controller.errors.isNotEmpty)
                          ...controller.errors
                              .map((element) => Text(
                                    element,
                                    style: TextStyle(color: Colors.red),
                                  ))
                              .toList(),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: OutlinedButton(
                              onPressed: () {
                                controller.auth();
                              },
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states.isNotEmpty &&
                                        !states
                                            .contains(MaterialState.disabled)) {
                                      return Color(0xFF271019);
                                    }
                                    return Color(0xFF8A8A8A);
                                  }),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 10)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(46.0))),
                                  side: MaterialStateProperty.all(BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                      style: BorderStyle.none))),
                              child: Text("Entrar".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
