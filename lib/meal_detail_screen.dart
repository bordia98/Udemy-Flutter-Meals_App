import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import './dummy_data.dart';


class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var arguments = ModalRoute.of(context).settings.arguments as Map<String,String>;

    String id =arguments['id'];
    var actualitem = DUMMY_MEALS.where((item){
      return item.id == id;
    }).toList();
    Meal item = actualitem[0];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.title,
            ),
        ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text("Ingredients",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                      border:  Border.all(
                        color: Colors.lime,
                        // color: Theme.of(context).primaryColor,
                        width: 4
                      )
                    ),
                    height: 150,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (ctx,index) {
                        return Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "${item.ingredients[index]}",
                              style: Theme.of(context).textTheme.body1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      itemCount:item.ingredients.length ,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text("Steps",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                      border:  Border.all(
                        color: Colors.lime,
                        // color: Theme.of(context).primaryColor,
                        width: 4
                      )
                    ),
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (ctx,index) {
                        return Card(
                          // color: Theme.of(context).accentColor,
                          elevation: 5,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              " # ${index+1} )  ${item.steps[index]}",
                              // style: TextStyle(color: Colors.white),
                              style: Theme.of(context).textTheme.body1,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        );
                      },
                      itemCount:item.steps.length ,
                    ),
                  ),
                ],
              ),
            ),
          ),
      );
  }
}