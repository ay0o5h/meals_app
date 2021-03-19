import 'package:flutter/material.dart';

class mainDrawer extends StatelessWidget {
  Widget listTile(String title,IconData icon,Function tabHandler){
    return  ListTile(
      onTap: tabHandler,
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        (title),
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            ),

      ),
    );
  }
  void selectedTile(){

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              ('cooking up'),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listTile('meal',Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/categoriesScreen');}),
          listTile('filter',Icons.settings,(){Navigator.of(context).pushReplacementNamed('/filterscreen');}),
        //  listTile('favourit',Icons.star,(){Navigator.of(context).pushReplacementNamed('/favourit_screen');})

        ],
      ),
    );
  }
}
