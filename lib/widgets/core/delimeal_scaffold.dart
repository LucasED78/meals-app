import 'package:flutter/material.dart';
import 'package:meals_app/widgets/core/widgets/drawer/delimeal_drawer.dart';

class DelimealScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final bool drawer;
  final FloatingActionButton floatingActionButton;
  final List<Widget> actions;

  const DelimealScaffold({
    @required this.title,
    @required this.body,
    this.drawer = false,
    this.floatingActionButton,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: actions != null ? actions : [],
      ),
      drawer: drawer ? DelimealDrawer() : null,
      body: body,
      floatingActionButton: floatingActionButton != null ? floatingActionButton : Container(),
    );
  }
}