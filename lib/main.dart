import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/favourit_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_details_screens.dart';
import 'package:meals_app/screens/tabs_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters= {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,

  };
   List<Meal> avaliableMeal=DUMMY_MEALS;
  List<Meal> favouritMeal=DUMMY_MEALS;
  void _setFilter(Map<String,bool> _filtersData){
   setState(() {
     _filters=_filtersData;
     avaliableMeal=DUMMY_MEALS.where((meal) {
       if(_filters['Gluten'] && !meal.isGlutenFree){
       return false;
       }
       if(_filters['Lactose'] && !meal.isLactoseFree){
         return false;
       }
       if(_filters['Vegan'] && !meal.isVegan){
         return false;
       }
       if(_filters['Vegetarian'] && !meal.isVegetarian){
         return false;
       }
       return true;
     }).toList();
   });
  }
   void toggleFilter(String mealId){
    final existIndex=favouritMeal.indexWhere((meal) => meal.id == mealId);
    if(existIndex >=0){
      setState(() {
        favouritMeal.removeAt(existIndex);
      });
    }
    else{
      setState(() {
        favouritMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }

   }
   bool isMealFavourite(String Id){
   return favouritMeal.any((meal) => meal.id == Id);
   }
  static const MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

          primarySwatch: white,
          accentColor: Color(0xffC26DBC),
          canvasColor: Colors.white,
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              title: TextStyle(
                  fontSize: 15,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
     // home: MyHomePage(),
     // home: categoriesScreen(),
      routes: {
        '/': (context) => MyHomePage(),
         '/categoriesScreen':(context) => categoriesScreen(),
        '/mealCategory':(context) => categoryMealsScreen(avaliableMeal),
        '/mealDetails':(context) => mealDetailsScreen(toggleFilter,isMealFavourite),
        '/filterscreen':(context)=> filter_screen(_setFilter, _filters),
       // '/tabScreen' :(context) => tabScreen(favouritMeal),
       // '/favourit_screen' :(context)=> favourit_screen(favouritMeal)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('meals'),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.network('https://cdn.pixabay.com/photo/2018/07/08/14/19/apricots-3523997_960_720.jpg',fit: BoxFit.cover,)

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushReplacementNamed(
            '/categoriesScreen'
          );
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
