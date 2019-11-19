import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/core/delimeal_scaffold.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final Category _category;

  // const CategoryMealsScreen(this._category);

  @override
  Widget build(BuildContext context) {

    final _category = ModalRoute.of(context).settings.arguments as Category;

    return DelimealScaffold(
      title: _category.title,
      body: Text(_category.title),
    );
  }
}