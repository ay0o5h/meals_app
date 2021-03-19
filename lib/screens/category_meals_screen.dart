import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/models/meal.dart';
class categoryMealsScreen extends StatefulWidget {
  final List<Meal> avaliableMeal;

  const categoryMealsScreen(this.avaliableMeal) ;
  @override
  _categoryMealsScreenState createState() => _categoryMealsScreenState();
}

class _categoryMealsScreenState extends State<categoryMealsScreen> {
  String CategoryTitle;
  List<Meal> displayMeal;
  @override
  void didChangeDependencies() {
    final routarg=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categId=routarg['id'];
    CategoryTitle=routarg['title'];
    displayMeal=widget.avaliableMeal.where((meal)
    {
      return meal.categories.contains(categId);
    } ).toList();
    super.didChangeDependencies();
  }
  @override
  void initState() {

    super.initState();
  }
  void removeItem(String mealid){
    setState(() {
      displayMeal.removeWhere((meal) => meal.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text(CategoryTitle,style: TextStyle(color: Color(0xffC26DBC))),
          iconTheme: IconThemeData(color:Color(0xffC26DBC)),

    ),
      body:ListView.builder(
          itemBuilder: (ctx,index){
            return meal_item(
              id: displayMeal[index].id,
                imageUrl: displayMeal[index].imageUrl,
              title: displayMeal[index].title,
              duration: displayMeal[index].duration,
              complexity: displayMeal[index].complexity,
              affordability: displayMeal[index].affordability,
                //removeItem:removeItem
            );
          },
        itemCount: displayMeal.length,
      ),
    );
  }
}
