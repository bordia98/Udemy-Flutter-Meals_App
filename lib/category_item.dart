import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id,this.title,this.color});

  void _selectcategory(BuildContext ctx){

    Navigator.of(ctx).pushNamed(
      "/category-meals",
      arguments: {
        "id":id,
        "title":title
      });
    // Navigator.of(ctx).push(MaterialPageRoute(
    //   builder: (_){
    //     return MealsScreen(id: id,title: title);    
    //   }
    // ));

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: ()=>_selectcategory(context),
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.5),
                  color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.body1,
                // style: TextStyle(
                //   fontSize: 18,
                //   fontWeight: FontWeight.bold
                // ),
              ),
            ),
      ),
    );
  }
}
