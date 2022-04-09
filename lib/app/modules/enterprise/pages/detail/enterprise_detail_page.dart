import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/constants/env.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/app_bar.dart';
import 'package:ioasys_empresas_flutter/app/core/widgets/app_scaffold_custom.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/models/enterprise_model.dart';

import 'enterprise_detail_store.dart';

class EnterpriseDetailPage extends StatefulWidget {
  const EnterpriseDetailPage({Key? key}) : super(key: key);

  @override
  State<EnterpriseDetailPage> createState() => _EnterpriseDetailPageState();
}

class _EnterpriseDetailPageState
    extends ModularState<EnterpriseDetailPage, EnterpriseDetailStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AppScaffoldCustom(
        appBar: AppBarCustom2(title: Observer(builder: (_) {
          if (controller.isLoading) return Container();
          EnterpriseModel enterprise = controller.enterprise!;
          return RichText(
            text: TextSpan(
              text: '${enterprise.enterpriseName} \n',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy'),
              children: <TextSpan>[
                TextSpan(
                    text:
                        "${enterprise.city} - ${enterprise.enterpriseType?.enterpriseTypeName}",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        fontFamily: 'Gilroy Light')),
              ],
            ),
          );
        })),
        isLoading: controller.isLoading,
        body: [
          if (controller.isLoading)
            Center(
              child: Container(child: CircularProgressIndicator()),
            ),
          if (controller.enterprise == null)
            Center(
              child: Text('Nenhuma empresa encontrada'),
            ),
          Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16)),
                  child: Image.network(
                      '$SERVER_HOST/${controller.enterprise?.photo}'),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.enterprise?.city} - ${controller.enterprise?.country}",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gilroy'),
                      ),
                      Text(
                        "\$${controller.enterprise?.sharePrice}",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gilroy'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "${controller.enterprise?.description}",
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Gilroy Light'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
