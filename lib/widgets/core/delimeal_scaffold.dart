import 'package:flutter/material.dart';

class DelimealScaffold extends StatelessWidget {

  final String title;
  final Widget body;

  const DelimealScaffold({
    @required this.title,
    @required this.body
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: body,
    );
  }
}