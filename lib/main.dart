import 'package:flutter/material.dart';
import './models/meal.dart';
import './filter_screen.dart';
import './meal_detail_screen.dart';
import './tab_screen.dart';
import './category_meals_screen.dart';
import './dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> tofilter = {
    'gluten' : false,
    'vegan' : false,
    'vegetarian' : false,
    'lactose' : false,
  };

  List<Meal> availablemeals;

  void setfilter(Map<String,bool> _mapit){
    setState(() {
      tofilter = _mapit;
      availablemeals = DUMMY_MEALS.where((meal){
        
        if(!meal.isGlutenFree && tofilter['gluten']){
          return false;
        }

        if(!meal.isVegan && tofilter['vegan']){
          return false;
        }

        if(!meal.isVegetarian && tofilter['vegetarian']){
          return false;
        }
        
        if(!meal.isLactoseFree && tofilter['lactose']){
          return false;
        }
        return true; 
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 128, 128, 1),
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
              fontWeight: FontWeight.bold
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
            ),
      ),
      // home: TabScreen(),
      routes: {
        '/': (ctx) => TabScreen(),
        '/category-meals': (ctx) => MealsScreen(availablemeals),
        '/meal-detail': (ctx) => MealDetailScreen(),
        "/filter": (ctx) => FilterScreen(tofilter,setfilter),
      },
    );
  }
}
