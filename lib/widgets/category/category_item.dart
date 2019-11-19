import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/category/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {

  final Category _category;

  CategoryItem(this._category);

  void _selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: _category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: _category.color,
        child: Center(
          child: Text(_category.title),
        ),
      ),
      onTap: () => _selectCategory(context),
    );
  }
}
