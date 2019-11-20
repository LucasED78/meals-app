import 'package:flutter/material.dart';
import 'package:meals_app/widgets/core/widgets/drawer/delimeal_drawer_item.dart';
import 'package:meals_app/widgets/core/widgets/drawer/delimeal_drawer_title.dart';
import 'package:meals_app/widgets/filters/FilterScreen.dart';

class DelimealDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DelimealDrawerTitle(title: "Cooking up!"),
          DelimealDrawerItem(
            icon: Icons.restaurant,
            title: "Meals",
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          const SizedBox(height: 1),
          DelimealDrawerItem(
            icon: Icons.settings,
            title: "Filters",
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
