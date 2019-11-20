import 'package:flutter/material.dart';
import 'package:meals_app/widgets/core/delimeal_scaffold.dart';

class FilterScreen extends StatelessWidget {

  static const routeName = "/filters";

  @override
  Widget build(BuildContext context) {
    return DelimealScaffold(
      title: "Filters",
      drawer: true,
      body: Center(child: Text("Filters!!"),),
    );
  }
}
