
import 'package:f3/pages/bed.dart';
import 'package:f3/pages/cabinetry.dart';
import 'package:f3/pages/chair.dart';
import 'package:f3/pages/kitchen.dart';
import 'package:f3/pages/sofa.dart';
import 'package:flutter/material.dart';
import 'package:f3/pages/table1.dart';


class Horizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
           InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Sofa()));
            },
            child: Container(
            width: 100.0,
              child: ListTile(
            title: Image.asset(
              'images/furniture/sofa1.png',
              width: 100.0,
              height: 80.0,
            ),

            subtitle: Container(
              alignment: Alignment.topCenter,
              child:Text('Sofa'),
            ),
          ),
        ),
      ),
       InkWell(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> new Bed()));

      },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              'images/furniture/bed.jpg',
              width: 100.0,
              height: 80.0,
            ),

            subtitle: Container(
              alignment: Alignment.topCenter,
              child:Text('Bed'),
            ),
          ),
        ),
      ),

      InkWell(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cabinetry()));

      },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              'images/furniture/cab.jpg',
              width: 100.0,
              height: 80.0,
            ),

            subtitle: Container(
              alignment: Alignment.topCenter,
              child:Text('Cabinetry'),
            ),
          ),
        ),
      ),

      InkWell(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> new Table1()));

      },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              'images/furniture/table1.png',
              width: 100.0,
              height: 80.0,
            ),

            subtitle: Container(
              alignment: Alignment.topCenter,
              child:Text('Table'),
            ),
          ),
        ),
      ),

      InkWell(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> new Kitchen()));

      },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              'images/furniture/kitchen.jpg',
              width: 100.0,
              height: 80.0,
            ),

            subtitle: Container(
              alignment: Alignment.topCenter,
              child:Text('Kitchen'),
            ),
          ),
        ),
      ),

      InkWell(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> new Chair()));

      },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              'images/furniture/chair1.jpg',
              width: 100.0,
              height: 80.0,
            ),

            subtitle: Container(
              alignment: Alignment.topCenter,
              child:Text('Chair'),
            ),
          ),
        ),
      ),

      

        ],
      ),
    );
  }
}

