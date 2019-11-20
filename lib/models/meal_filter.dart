import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealFilter {
  bool glutenFree;
  bool lactoseFree;
  bool vegan;
  bool vegetarian;

  MealFilter({
    @required this.glutenFree,
    @required this.lactoseFree,
    @required this.vegan,
    @required this.vegetarian
  });

  factory MealFilter.filter(MealFilter filterData){
    return new MealFilter(
      glutenFree: filterData.glutenFree,
      lactoseFree: filterData.lactoseFree,
      vegan: filterData.vegan,
      vegetarian: filterData.vegetarian
    );
  }

  List<Meal> filterMeals (List<Meal> meals){
    return meals.where((meal){
      if (glutenFree && !meal.isGlutenFree) return false;
      if (lactoseFree && !meal.isLactoseFree) return false;
      if (vegan && !meal.isVegan) return false;
      if (vegetarian && !meal.isVegetarian) return false;

      return true;
    }).toList();
  }
}