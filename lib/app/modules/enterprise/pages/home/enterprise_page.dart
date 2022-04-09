import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/constants/env.dart';
import 'package:ioasys_empresas_flutter/app/core/store/auth_store.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/app_scaffold_custom.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/card_custom.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/drawer_custom.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/models/enterprise_model.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/model/investor_model.dart';

import 'enterprise_store.dart';

class EnterprisePage extends StatefulWidget {
  const EnterprisePage({Key? key}) : super(key: key);

  @override
  State<EnterprisePage> createState() => _EnterprisePageState();
}

class _EnterprisePageState
    extends ModularState<EnterprisePage, EnterpriseStore> {
  @override
  Widget build(BuildContext context) {
    InvestorModel investorModel = Modular.get<AuthStore>().investorModel!;

    return Observer(builder: (_) {
      return AppScaffoldCustom(
        appBar: SliverAppBar(
          title: Text('Empresas'),
          floating: true,
          pinned: true,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 100,
          flexibleSpace: Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: DrawerCustom(
          menuItems: [
            ListTile(
              title: Text('Pesquisar'),
              onTap: () {
                Modular.to.pop();
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                Modular.get<AuthStore>().clearStore();
              },
            ),
          ],
          accountPhoto: investorModel.photo != null
              ? Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('${investorModel.photo}'))),
                )
              : Container(),
          accountEmail: investorModel.email,
          accountName: investorModel.investorName,
        ),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                child: Text(
                  'Pesquise por \numa empresa',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, fontFamily: 'Gilroy', height: 0.9),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Buscar...',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              if (controller.isLoading)
                Center(
                  child: CircularProgressIndicator(),
                ),
              if (!controller.isLoading &&
                  controller.searchResults.isEmpty &&
                  controller.searchController.text.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset("assets/images/not-found.png"),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Empresa não encontrada'),
                      ],
                    ),
                  ),
                ),
            ]),
          ),
          if (controller.searchResults.isNotEmpty)
            SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              delegate: SliverChildListDelegate(
                controller.searchResults
                    .map((e) => Container(
                        padding: EdgeInsets.all(8),
                        child: CardCustomWidget(enterpriseModel: e)))
                    .toList(),
              ),
            ),
        ],
        
      );
    });
  }
}
