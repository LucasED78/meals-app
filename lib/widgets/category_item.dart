import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryItem extends StatelessWidget {

  final Category _category;

  CategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _category.color,
      child: Center(
        child: Text(_category.title),
      ),
    );
  }
}
