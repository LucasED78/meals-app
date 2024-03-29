import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/core/delimeal_scaffold.dart';
import 'package:meals_app/widgets/meals/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool _dataInitialized = false;
  Category _category;
  List<Meal> _categoryMeals;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (!_dataInitialized) {
      _category = ModalRoute.of(context).settings.arguments as Category;
      _categoryMeals = widget._availableMeals.where((ms){
        return ms.categories.contains(_category.id);
      }).toList();
    }

    _dataInitialized = true;
  }

  void _removeMeal(String mealId){
    setState(() {
      _categoryMeals.removeWhere((m) => m.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return DelimealScaffold(
      title: _category.title,
      body: _categoryMeals.isNotEmpty ? ListView.builder(
        itemCount: _categoryMeals.length,
        itemBuilder: (context, index){
          return MealItem(_categoryMeals[index]);
        },
      ) : Center(child: Text("No meals for this category", style: Theme.of(context).textTheme.title,),)
    );
  }
}
