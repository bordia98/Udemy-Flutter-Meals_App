import 'package:flutter/material.dart';
import './meal_item.dart';
import './models/meal.dart';
import './dummy_data.dart';


class MealsScreen extends StatelessWidget {

  List<Meal> available;

  MealsScreen(this.available);

  String id;
  String title;

  // MealsScreen({@required this.id,@required this.title});

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments as Map<String,String>;
    id = arguments['id'];
    title = arguments['title'];

    List<Meal> categoryMeals;

    if(available == null){
        categoryMeals = DUMMY_MEALS.where( (meal){
        return meal.categories.contains(id);
      }).toList();
    }else{
        categoryMeals = available.where((meal){
        return meal.categories.contains(id);
        }
      ).toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
          ),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx,index) {
            return MealItem( 
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              url: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,  
            );  //  Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}