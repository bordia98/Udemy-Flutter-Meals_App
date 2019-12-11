import 'package:flutter/material.dart';
import './models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String url;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.url,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
  });


  String get complex{
    if (complexity == Complexity.Simple){
      return "Simple";
    }
    if (complexity == Complexity.Challenging){
      return "Challenging";
    }
    if (complexity == Complexity.Hard){
      return "Hard";
    }
    return "Unknown";
  }

  String get afford{
    if(affordability == Affordability.Affordable){
      return "Affordable";
    }
    if(affordability == Affordability.Pricey){
      return "Costly";
    }
    if(affordability == Affordability.Luxurious){
      return "Luxurious";
    }
    return "Unknown";
  }

  void _selectmeal(BuildContext context){
    Navigator.of(context).pushNamed(
      "/meal-detail",
      arguments: {
        "id":id,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> _selectmeal(context), 
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: <Widget>[
            Stack( children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
                ),
                child: Image.network(url),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                    width: 300,
                    padding: EdgeInsets.all(5),
                    color: Colors.black54,
                    child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                      ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("${duration} min ")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(complex)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(afford)
                    ],
                  ),
                ],  
              ),
            )
          ],
        ),
      ),
    );
  }
}