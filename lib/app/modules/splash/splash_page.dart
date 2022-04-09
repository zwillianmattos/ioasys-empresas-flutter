import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _delayLoading();
  }

  _delayLoading() async {
    // TODO: Check if user is logged in and redirect to home page or login page
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacementNamed('/users/auth/sign_in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            "assets/images/logo.png",
            scale: 1.5,
          ),
        ),
      ),
    );
  }
}
