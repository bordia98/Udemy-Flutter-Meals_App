import 'package:flutter/material.dart';
import './main_drawer_screen.dart';

class FilterScreen extends StatefulWidget {
  
  final Function savefilter;
  final Map<String,bool> filtermap;

  FilterScreen(this.filtermap,this.savefilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {


  bool _isglutenfree = false;

  bool _isvegan = false;

  bool _isvegetarian = false;

  bool _islactosefree = false;

  @override
  initState(){
    _isglutenfree = widget.filtermap['gluten'];
    _islactosefree = widget.filtermap['lactose'];
    _isvegetarian = widget.filtermap['vegetarian'];
    _isvegan = widget.filtermap['vegan'];
    super.initState();
  }

  Widget switchwidget({String title, String subtitle, bool val,Function updatevalue}){
    return SwitchListTile(
      activeColor: Colors.red,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
        ),
      subtitle: Text(subtitle),
      value: val,
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {

    var decor = BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.withOpacity(0.4),
                      Colors.green.withOpacity(0.1)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  ),
                      border:  Border.all(
                        color: Colors.amber,
                        width: 4,
                      )
                    );

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Text(
            "Filters",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save)
              ,
            onPressed: (){
              Map<String,bool> tofilter = {
                'gluten' : _isglutenfree,
                'vegan' : _isvegan,
                'vegetarian' : _isvegetarian,
                'lactose' : _islactosefree,
              };
              widget.savefilter(tofilter);
            }
          )
        ],
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                "Customize Your Meals",
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: decor, 
              child: switchwidget(
                  title: "Gluten Free",
                  subtitle: "Customize whether you want Gluten Free Meal or Not",
                  val: _isglutenfree,
                  updatevalue: (newvalue){
                    setState(() {
                      _isglutenfree = newvalue;
                    });
                  }
                ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: decor, 
              child: switchwidget(
                  title: "Lactose Free",
                  subtitle: "Customize whether you want Lactose Free Meal or Not",
                  val: _islactosefree,
                  updatevalue: (newvalue){
                    setState(() {
                      _islactosefree = newvalue;
                    });
                  }
                ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: decor, 
              child: switchwidget(
                  title: "Vegan",
                  subtitle: "Customize whether you want Vegan Meal or Not",
                  val: _isvegan,
                  updatevalue: (newvalue){
                    setState(() {
                      _isvegan = newvalue;
                    });
                  }
                ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: decor, 
              child: switchwidget(
                  title: "Vegetarian",
                  subtitle: "Customize whether you want Vegetarian  Meal or Not",
                  val: _isvegetarian,
                  updatevalue: (newvalue){
                    setState(() {
                      _isvegetarian = newvalue;
                    });
                  }
                ),
            )
          ],
        ),
      ),
    );
  }
}