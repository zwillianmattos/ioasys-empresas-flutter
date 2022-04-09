import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacity = 1;
  bool startAnim = false;

  @override
  void initState() {
    super.initState();

    _delayLoading();
  }

  _delayLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacity = 0;
      startAnim = true;
    });
    // TODO: Check if user is logged in and redirect to home page or login page
    await Future.delayed(const Duration(seconds: 1));
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              bottom: MediaQuery.of(context).size.height / 3,
              top: 0,
              duration: const Duration(seconds: 3),
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: opacity,
                child: Image.asset(
                  "assets/images/logo.png",
                  scale: 1.5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
