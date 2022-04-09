import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_empresas_flutter/app/core/constants/env.dart';
import 'package:ioasys_empresas_flutter/app/modules/enterprise/models/enterprise_model.dart';

class CardCustomWidget extends StatefulWidget {
  final EnterpriseModel enterpriseModel;
  const CardCustomWidget({Key? key, required this.enterpriseModel})
      : super(key: key);

  @override
  State<CardCustomWidget> createState() => _CardCustomWidgetState();
}

class _CardCustomWidgetState extends State<CardCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to
            .pushNamed('/enterprise/details/${widget.enterpriseModel.id}');
      },
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 12,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                '$SERVER_HOST/${widget.enterpriseModel.photo}',
                height: 85,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.only( bottom: 8.0, left: 8.0, right: 8.0),
              child: Text('${widget.enterpriseModel.enterpriseName}',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'Gilroy Light',
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
