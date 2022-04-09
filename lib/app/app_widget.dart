import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(39, 16, 25, .1),
      100: Color.fromRGBO(39, 16, 25, .2),
      200: Color.fromRGBO(39, 16, 25, .3),
      300: Color.fromRGBO(39, 16, 25, .4),
      400: Color.fromRGBO(39, 16, 25, .5),
      500: Color.fromRGBO(39, 16, 25, .6),
      600: Color.fromRGBO(39, 16, 25, .7),
      700: Color.fromRGBO(39, 16, 25, .8),
      800: Color.fromRGBO(39, 16, 25, .9),
      900: Color.fromRGBO(39, 16, 25, 1),
    };

    ThemeData defaultTheme = ThemeData(
      primarySwatch: MaterialColor(0xFF271019, color),
      primaryColor: MaterialColor(0xFF271019, color),
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Color(0xFF271019)),
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Gilroy Light'),
      ),
      // visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return MaterialApp.router(
      title: 'Ioasys Empresas',
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
