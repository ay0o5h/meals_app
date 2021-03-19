import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/tabs_screens.dart';
//import 'package:meals_app/screens/tabs_screens.dart';
import 'package:meals_app/widgets/category_items.dart';
import 'package:meals_app/widgets/mainDrawer.dart';

class categoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meal',style: TextStyle(color: Color(0xffC26DBC))),
        iconTheme: IconThemeData(color:Color(0xffC26DBC)),
      ),

      body: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catItem) =>
                  categoriesItems(catItem.id, catItem.title, catItem.color,catItem.img,))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          )),
      //  bottomNavigationBar: tabScreen(),
      drawer: mainDrawer(),
    );
  }
}
