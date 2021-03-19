import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class meal_item extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
 // final Function removeItem;

  const meal_item({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  //  @required this.removeItem,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;
    }
  }

  void selectItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/mealDetails',
      arguments: {
        'id':id
      }
    ).then((value) {
    //  if (value != null) removeItem(value);
    } );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectItem(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule,color: Color(0xffC26DBC),),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min',style: TextStyle(color: Color(0xffC26DBC),fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.shopping_bag,color: Color(0xffC26DBC),),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$complexityText',style: TextStyle(color: Color(0xffC26DBC),fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money,color: Color(0xffC26DBC),),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$affordabilityText',style: TextStyle(color: Color(0xffC26DBC),fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
