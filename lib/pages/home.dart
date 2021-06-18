import 'package:f3/pages/about.dart';
import 'package:f3/pages/fav.dart';
import 'package:f3/pages/language.dart';
import 'package:f3/pages/myorder.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//   my own imports
import 'package:f3/components/horizontal_listview.dart';
import 'package:f3/components/products.dart';
import 'package:f3/pages/cart.dart';
import 'package:f3/pages/fav.dart';
import 'package:f3/pages/setting.dart';
import 'package:f3/pages/custservice.dart';
import 'package:f3/pages/about.dart';
import 'package:f3/pages/language.dart';
import 'package:f3/pages/myorder.dart';

import 'package:f3/pages/dummy.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel= new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images:[
          AssetImage("images/furniture/co1.jpg"),
          AssetImage("images/furniture/co2.jpg"),
          AssetImage("images/furniture/co3.jpg"),
          AssetImage("images/furniture/co4.jpg"),

          AssetImage("images/furniture/co5.jpg"),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.red,
        indicatorBgPadding: 2.0,
        dotBgColor:Colors.transparent ,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown,
        title: Text('Houzz'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              }),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(accountName: Text('Shivangi'),
              accountEmail: Text('shivangilad10@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.brown
              ),
            ),
            //body
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));

              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home,  color: Colors.blueGrey,),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Language()));

              },
              child: ListTile(
                title: Text('Language'),
                leading: Icon(Icons.language,  color: Colors.blueGrey,),
              ),
            ),

            InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> new MyOrder()));

              },
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.blueGrey,),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new CustService()));
              },
              child: ListTile(
                title: Text('Customer Service'),
                leading: Icon(Icons.supervised_user_circle, color: Colors.blueGrey,),
              ),
            ),

            InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> new Fav()));

              },
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),
            Divider(),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new SettingsOnePage()));

              },
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue,),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new About()));

              },
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          //image carousel begins here
          image_carousel,
          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Categories'),),

          //horizontal list view begins here
          Horizontal(),

          new Padding(padding: const EdgeInsets.all(12.0),
            child: new Text('Recent Products'),),

          //grid view
          Container(
            height: 320.0,
            child: Products(),
          )


        ],
      ),
    );
  }
}
