import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget {

  BuildContext ctx;

  Widget _buildListTile(String title,Icon icon,String route){
    return ListTile(
            leading: icon,
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                // color: Theme.of(ctx).primaryColor
              ),
            ),
            onTap: () => changescreen(route)
          );
    }

  void changescreen(String route){
    
    Navigator.of(ctx).pushReplacementNamed(route);

  }
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColor,
              child: Text(
                "Cooking Up !",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildListTile(
              "Meals",
              Icon(
                Icons.restaurant,
                size: 26,
              ),
              "/"
            ),
            _buildListTile(
              "Filters",
              Icon(
                Icons.filter_list,
                size: 26,
              ),
              "/filter"
            ),
         ],
        ),      
    );
  }
}