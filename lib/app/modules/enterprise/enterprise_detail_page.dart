import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/enterprise_detail_store.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/models/enterprise_model.dart';

class EnterpriseDetailPage extends StatefulWidget {
  const EnterpriseDetailPage({Key? key}) : super(key: key);

  @override
  State<EnterpriseDetailPage> createState() => _EnterpriseDetailPageState();
}

class _EnterpriseDetailPageState
    extends ModularState<EnterpriseDetailPage, EnterpriseDetailStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (x) {
          if (controller.isLoading)
            return Container(
              child: Center(
                child: Container(child: CircularProgressIndicator()),
              ),
            );

          if (controller.enterprise == null)
            return Center(
              child: Text('Nenhuma empresa encontrada'),
            );

          EnterpriseModel enterprise = controller.enterprise!;
          return CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: false,
                elevation: 0,
                toolbarHeight: 100,
                flexibleSpace: Image(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                title: Observer(builder: (_) {
                  if (controller.isLoading) return Container();
                  EnterpriseModel enterprise = controller.enterprise!;
                  return RichText(
                    text: TextSpan(
                      text: '${enterprise.enterpriseName} \n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                "${enterprise.city} - ${enterprise.enterpriseType?.enterpriseTypeName}",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 16)),
                      ],
                    ),
                  );
                }),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(16)),
                            child: Image.network(
                                'https://empresas.ioasys.com.br/${enterprise.photo}'),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${enterprise.city} - ${enterprise.country}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$${enterprise.sharePrice}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${enterprise.description}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
