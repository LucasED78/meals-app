import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meals/category_meals_screen.dart';
import 'package:meals_app/widgets/category/category_screen.dart';
import 'package:meals_app/widgets/meals/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: CategoryScreen(),
      routes: {
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (_) => MealDetailScreen()
      },
    );
  }
}