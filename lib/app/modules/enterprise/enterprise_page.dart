import 'package:flutter/material.dart';

class EnterprisePage extends StatefulWidget {
  const EnterprisePage({ Key? key }) : super(key: key);

  @override
  State<EnterprisePage> createState() => _EnterprisePageState();
}

class _EnterprisePageState extends State<EnterprisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text('Enterprise'),
        ],
      ),
    );
  }
}