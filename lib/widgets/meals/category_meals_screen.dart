import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/core/delimeal_scaffold.dart';
import 'package:meals_app/widgets/meals/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final Category _category;

  // const CategoryMealsScreen(this._category);

  @override
  Widget build(BuildContext context) {

    final _category = ModalRoute.of(context).settings.arguments as Category;
    final _categoryMeals = DUMMY_MEALS.where((ms){
      return ms.categories.contains(_category.id);
    }).toList();

    return DelimealScaffold(
      title: _category.title,
      body: ListView.builder(
        itemCount: _categoryMeals.length,
        itemBuilder: (context, index){
          return MealItem(_categoryMeals[index]);
        },
      ),
    );
  }
}