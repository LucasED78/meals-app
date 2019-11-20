import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  List<Meal> _favoritedMeals;

  FavoritesScreen(this._favoritedMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoritedMeals.isEmpty) {
      return Center(
        child: Text("No favorites added yet!! Why not add one?", style: Theme.of(context).textTheme.title,),
      );
    }
    else {
      return ListView.builder(
        itemCount: _favoritedMeals.length,
        itemBuilder: (context, index){
          return MealItem(_favoritedMeals[index]);
        },
      );
    }
  }
}