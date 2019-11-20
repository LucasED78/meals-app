import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/models/meal_filter.dart';
import 'package:meals_app/widgets/core/tabs_screen.dart';
import 'package:meals_app/widgets/filters/FilterScreen.dart';
import 'package:meals_app/widgets/meals/category_meals_screen.dart';
import 'package:meals_app/widgets/category/category_screen.dart';
import 'package:meals_app/widgets/meals/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  MealFilter _filters = MealFilter(
    glutenFree: false,
    lactoseFree: false,
    vegan: false,
    vegetarian: false
  );

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(MealFilter filterData) {
    setState(() {
      _filters = MealFilter.filter(filterData);
      _availableMeal = _filters.filterMeals(DUMMY_MEALS);
    });
  }

  void _toggleFavorites(Meal meal){
    final int index = _favoriteMeals.indexWhere((ml) => ml.id == meal.id);

    if (index == -1) {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
    else {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    }
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.any((ml) => ml.id == meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.white,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                  color: Colors.white
              ),
              body2: TextStyle(
                  color: Colors.black87
              ),
              title: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20, fontWeight: FontWeight.bold)
          )
      ),
//      home: CategoryScreen(),
      routes: {
        '/': (_) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routeName: (_) => MealDetailScreen(_toggleFavorites, _isFavorite),
        FilterScreen.routeName: (_) => FilterScreen(updatedFilters: _filters, saveFilters: _setFilters)
      },
    );
  }
}
