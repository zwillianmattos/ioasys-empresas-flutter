import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;

  const AppBarCustom(
      {Key? key, required this.title, this.actions, this.leading})
      : super(key: key);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      snap: false,
      leading: widget.leading ?? null,
      actions: widget.actions ?? [],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0,
              bottom: -50,
              child: Container(
                child: Center(
                  child: Image.asset(
                    "assets/images/logo-markdown.png",
                    scale: 1,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0,
                    0.1,
                    0.3,
                    1,
                  ],
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
        title: widget.title,
        titlePadding: EdgeInsets.only(left: 16, right: 20, bottom: 34),
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
    );
  }
}

class AppBarCustom2 extends StatefulWidget {
  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;

  const AppBarCustom2(
      {Key? key, required this.title, this.actions, this.leading})
      : super(key: key);

  @override
  State<AppBarCustom2> createState() => _AppBarCustomState2();
}

class _AppBarCustomState2 extends State<AppBarCustom2> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
      title: widget.title,
    );
    ;
  }
}
