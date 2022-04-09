import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppScaffoldCustom extends StatefulWidget {
  final Widget appBar;
  final List<Widget>? body;
  final bool isLoading;
  final Widget? drawer;
  final List<Widget>? slivers;

  AppScaffoldCustom(
      {Key? key,
      this.drawer,
      this.body,
      required this.appBar,
      this.slivers,
      this.isLoading = false})
      : super(key: key);

  @override
  State<AppScaffoldCustom> createState() => _AppScaffoldCustomState();
}

class _AppScaffoldCustomState extends State<AppScaffoldCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer ?? null,

      body: Observer(
        builder: (_) {
          if (widget.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                widget.appBar,
                if (widget.slivers != null)
                  ...widget.slivers!
                else
                  SliverList(
                    delegate: SliverChildListDelegate(widget.body!),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
