import 'package:flutter/material.dart';
import './main_drawer_screen.dart';
import './favorites_screen.dart';
import './categories_screen.dart';


class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              "Meals App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                ),
              ),
          ),
          // bottom: TabBar(
          //   tabs: <Widget>[
          //     Tab(
          //       icon: const Icon(Icons.category),
          //       text: "Categories",
          //     ),
          //     Tab(
          //       icon: const Icon(Icons.favorite),
          //       text: "Favorites",
          //     )
          //   ],
          // ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: <Widget>[
            Categories(),
            Favorites()
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            tabs: <Widget>[
                Tab(
                  icon: const Icon(Icons.category),
                  text: "Categories",
                ),
                Tab(
                  icon: const Icon(Icons.favorite),
                  text: "Favorites",
                )
              ],
          ),
        ),
      ),
    );
  }
}