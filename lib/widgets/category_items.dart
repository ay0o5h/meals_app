import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class categoriesItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  final String img;

  categoriesItems(this.id, this.title, this.color, this.img);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/mealCategory',
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        //  padding: EdgeInsets.all(15),

        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          Container(
            height: 180,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 7),
            child: Text(
              title,
              style: TextStyle(
               color: Color(0xffC26DBC),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed'),
            ),
          ),
        ]),
      ),
    );
  }
}
