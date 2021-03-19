import 'package:flutter/material.dart';
import 'package:meals_app/widgets/mainDrawer.dart';
import 'package:meals_app/main.dart';

class filter_screen extends StatefulWidget {
  final Function saveFilter;
  final Map<String,bool>  _filters;
  const filter_screen( this.saveFilter, this._filters) ;

  @override
  _filter_screenState createState() => _filter_screenState();
}

class _filter_screenState extends State<filter_screen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  @override
  initState(){
    isGlutenFree = widget._filters['Gluten'];
    isLactoseFree =  widget._filters['Lactose'];
    isVegan =  widget._filters['Vegan'];
    isVegetarian =  widget._filters['Vegetarian'];
    super.initState();
  }

  Widget switchList(String titlemeal, String subtitle, bool val, Function chg) {
    return SwitchListTile(
      title: Text(
        titlemeal,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(subtitle),
      value: val,
      onChanged: chg,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color:Color(0xffC26DBC)),
        title: Text('your Filter',style: TextStyle( color:Color(0xffC26DBC),),),
        actions: [
         IconButton(icon: Icon(Icons.save), onPressed:(){
           final Map<String,bool> selectedFilter = {
             'Gluten': isGlutenFree,
             'Lactose': isLactoseFree,
             'Vegan': isVegan,
             'Vegetarian': isVegetarian,

           };
           widget.saveFilter(selectedFilter);
         } )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              switchList(
                  'Gluten Free', 'only meal with Gluten Free', isGlutenFree,
                   (newValue) {
                setState(() {
                  isGlutenFree = newValue;
                });
              }),
              switchList(
                  'Lactose Free', 'only meal with iLactoseFree', isLactoseFree,
                  (newValue) {
                setState(() {
                  isLactoseFree = newValue;
                });
              }),
              switchList('Vegan', 'only meal  Vegan', isVegan, (newValue) {
                setState(() {
                  isVegan = newValue;
                });
              }),
              switchList('Vegetarian', 'only meal Vegetarian', isVegetarian,
                  (newValue) {
                setState(() {
                  isVegetarian = newValue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: mainDrawer(),
    );
  }
}
