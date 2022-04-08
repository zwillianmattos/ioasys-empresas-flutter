import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/store/auth_store.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/enterprise_store.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/models/enterprise_model.dart';
import 'package:ioasys_empresas_flutter/app/modules/users/auth/sign_in/model/investor_model.dart';

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

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              margin: EdgeInsets.only(bottom: 40.0),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage('${investorModel.photo}'))),
              ),
              accountName: new Container(
                  child: Text(
                '${investorModel.investorName}',
              )),
              accountEmail: new Container(
                  child: Text(
                '${investorModel.email}',
              )),
            ),
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
                Modular.to.pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Empresas'),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
        flexibleSpace: Image(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Observer(builder: (_) {
          print(controller.isLoading);
          return CustomScrollView(slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'Pesquise por \numa empresa',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
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
                ),
                SizedBox(
                  height: 40,
                ),
                if (controller.isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (!controller.isLoading &&
                    controller.searchResults.isEmpty &&
                    controller.searchController.text.isNotEmpty)
                  Center(
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
              ]),
            ),
            if (controller.searchResults.isNotEmpty)
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                delegate: SliverChildListDelegate(
                  controller.searchResults.map((e) => _buildCard(e)).toList(),
                ),
              ),
          ]);
        }),
      ),
    );
  }

  Widget _buildCard(EnterpriseModel enterpriseModel) {
    return InkWell(
      onTap: () {
        print(Modular.to.path);
        Modular.to.pushNamed('/enterprise/details/${enterpriseModel.id}');
      },
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)), //<--custom shape
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                'https://empresas.ioasys.com.br/${enterpriseModel.photo}',
                height: 85,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text('${enterpriseModel.enterpriseName}',
                  style: TextStyle(fontSize: 12, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
