import 'package:flutter/material.dart';

class DrawerCustom extends StatefulWidget {
  final Widget? accountPhoto;
  final String? accountName;
  final String? accountEmail;
  final List<Widget> menuItems;

  const DrawerCustom(
      {Key? key,
      this.accountPhoto,
      this.accountName,
      this.accountEmail,
      required this.menuItems})
      : super(key: key);

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            currentAccountPicture: widget.accountPhoto ?? Container(),
            accountName: new Container(
                child: Text(
              '${widget.accountName}',
            )),
            accountEmail: new Container(
                child: Text(
              '${widget.accountEmail}',
            )),
          ),
          ...widget.menuItems,
        ],
      ),
    );
  }
}
