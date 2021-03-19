import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/favourit_screen.dart';
import 'package:meals_app/widgets/mainDrawer.dart';

class tabScreen extends StatefulWidget {
  final List<Meal> favouritMeal;

  const tabScreen(this.favouritMeal) ;
  @override
  _tabScreenState createState() => _tabScreenState();
}

class _tabScreenState extends State<tabScreen> {
  List<Map<String,Object>> _pages;
  @override
  void initState() {
    _pages=[
      {
        'page':categoriesScreen(),
        'title':'Categories',
      },
      {
        'page': favourit_screen(widget.favouritMeal),
        'title':'Faviorits',
      },
    ];
    super.initState();
  }
  var slectedIndex=0;
  void SelectedPage(int value){
     setState(() {
       slectedIndex=value;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[slectedIndex]['name']),
      ),
      body: null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: SelectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor:Theme.of(context).accentColor ,
        unselectedItemColor: Colors.white,
        currentIndex: slectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
            title: Text('category')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favourits')
          )
        ],
      ),

    );
  }
}
