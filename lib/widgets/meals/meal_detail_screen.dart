import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/core/delimeal_scaffold.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {

    final Meal _meal = ModalRoute.of(context).settings.arguments as Meal;

    Widget buildTitle(BuildContext context, String title){
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(title, style: Theme.of(context).textTheme.title),
        ),
      );
    }

    return DelimealScaffold(
      title: _meal.title,
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  _meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitle(context, "Ingredients"),
              Container(
                  height: 100,
                  child: ListView.builder(
                    itemCount: _meal.ingredients.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(_meal.ingredients[index], style: TextStyle(color: Colors.black),),
                      );
                    },
                  )
              ),
              const SizedBox(height: 20,),
              buildTitle(context, "Steps"),
              Container(
                height: 150,
                child: ListView.builder(
                  itemCount: _meal.steps.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text("${index + 1}", style: TextStyle(color: Theme.of(context).accentColor)),
                          ),
                          title: Text(_meal.steps[index], style: TextStyle(color: Colors.black),),
                        ),
                        if (index < _meal.steps.length - 1) Divider()
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "remove a meal",
        child: Icon(Icons.delete, color: Theme.of(context).errorColor,),
        onPressed: () => Navigator.of(context).pop(_meal.id),
      ),
    );
  }
}
