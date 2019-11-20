import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/category/category_item.dart';
import 'package:meals_app/widgets/core/delimeal_scaffold.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
        children: DUMMY_CATEGORIES.map<Widget>((cat) => CategoryItem(cat)).toList(),
    );
  }
}
