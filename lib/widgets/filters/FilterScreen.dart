import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_filter.dart';
import 'package:meals_app/widgets/core/delimeal_scaffold.dart';

class FilterScreen extends StatefulWidget {

  static const routeName = '/filters';

  final MealFilter updatedFilters;
  final Function saveFilters;

  FilterScreen({
    @required this.updatedFilters,
    @required this.saveFilters
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  _buildListTile(String title, String subtitle, bool value, Function updatedValue){
   return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: updatedValue,
    );
  }

  MealFilter _filter = MealFilter(
    glutenFree: false,
    lactoseFree: false,
    vegan: false,
    vegetarian: false
  );

  @override
  void initState() {
    // TODO: implement initState

    _filter = widget.updatedFilters;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DelimealScaffold(
      title: "Filters",
      actions: [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () => widget.saveFilters(_filter),
        )
      ],
      drawer: true,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Text("Adjust your meals", style: Theme.of(context).textTheme.title,),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildListTile("Gluten Free", "Only shows gluten free meals", _filter.glutenFree, (value){
                  setState(() {
                    _filter.glutenFree = value;
                  });
                }),
                _buildListTile("Lactose Free", "Only shows lactose free meals", _filter.lactoseFree, (value){
                  setState(() {
                    _filter.lactoseFree = value;
                  });
                }),
                _buildListTile("Vegan", "Only shows vegan meals", _filter.vegan, (value){
                  setState(() {
                    _filter.vegan = value;
                  });
                }),
                _buildListTile("Vegetarian", "Only shows vegetarian meals", _filter.vegetarian, (value){
                  setState(() {
                    _filter.vegetarian = value;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

