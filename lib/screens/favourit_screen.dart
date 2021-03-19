import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class favourit_screen extends StatelessWidget {
  final List<Meal> favouritMeal;

  const favourit_screen(this.favouritMeal) ;


  @override
  Widget build(BuildContext context) {
    if(favouritMeal.isEmpty) {
      return Center(
        child: Text('there is no favourit'),
      );
    }else {
      return ListView.builder(
        itemBuilder: (ctx,index){
          return meal_item(
              id: favouritMeal[index].id,
              imageUrl: favouritMeal[index].imageUrl,
              title: favouritMeal[index].title,
              duration: favouritMeal[index].duration,
              complexity: favouritMeal[index].complexity,
              affordability: favouritMeal[index].affordability,
              //removeItem:removeItem
          );
        },
        itemCount: favouritMeal.length,
      );
    }
  }
}
