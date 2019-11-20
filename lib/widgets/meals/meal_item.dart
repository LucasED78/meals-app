import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals/meal_detail_screen.dart';

class MealItem extends StatelessWidget {

  final Meal _meal;

  const MealItem(this._meal);

  get affordabilityText {
    switch (_meal.affordability){
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
    }
  }

  get complexityText {
    switch (_meal.complexity){
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challeging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknow";
    }
  }

  Widget _buildRow(IconData icon, String text){
    return Expanded(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(icon),
          ),
          Text(text, style: TextStyle(color: Colors.black),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  _meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    color: Colors.black54,
                    child: Text(
                      _meal.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                      textAlign: TextAlign.end,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildRow(Icons.schedule, "${_meal.duration}"),
                  _buildRow(Icons.work, complexityText),
                  _buildRow(Icons.attach_money, affordabilityText)
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () => {
        Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: _meal)
      },
    );
  }
}
