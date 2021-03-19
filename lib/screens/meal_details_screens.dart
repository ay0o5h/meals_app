import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class mealDetailsScreen extends StatelessWidget {
  final Function toggleFilter;
  final Function isMealFavourite;
  const mealDetailsScreen(this.toggleFilter,this.isMealFavourite) ;
  @override
  Widget build(BuildContext context) {
    final mealIds = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final mealId=mealIds['id'];
    final Selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color:Color(0xffC26DBC)),
        title: Text(Selectedmeal.title,style: TextStyle(color: Color(0xffC26DBC))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                Selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "ingredients",
                style: TextStyle(
                  color: Color(0xffC26DBC),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                 // border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )],
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 300,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(Selectedmeal.ingredients[index],style: TextStyle(color: Colors.white),),
                  ),
                ),
                itemCount: Selectedmeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "steps",
                style: TextStyle(
                  color: Color(0xffC26DBC),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
              BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )],
                  color: Colors.white,
                //  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 300,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(

                      leading: CircleAvatar(

                        child: Text('# ${index+1}',style: TextStyle(color: Color(0xffC26DBC)),),
                      ),
                        title: Text(Selectedmeal.steps[index],),
                      ),

                  ],
                ),
                itemCount: Selectedmeal.steps.length,
              ),
            )
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed:() => toggleFilter(mealId),
          child: Icon(isMealFavourite(mealId) ? Icons.star:Icons.star_border),
        )
    );
  }
}
