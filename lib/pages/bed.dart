import 'package:f3/pages/product_details.dart';
import 'package:flutter/material.dart';

class Bed extends StatefulWidget {
  @override
  _BedState createState() => _BedState();
}

class _BedState extends State<Bed> {
   var product_list = [
    {
      "name": "Bed",
      "picture": "images/furniture/bed/b1.jpg",
      "old_price": 5000,
      "price": 4000,
    },
    {
      "name": "Bed",
      "picture": "images/furniture/bed/b2.jpg",
      "old_price": 5000,
      "price": 4000,
    },
    {
      "name": "Bed",
      "picture": "images/furniture/bed/b3.jpg",
      "old_price": 6000,
      "price": 5000,
    },
    {
      "name": "Bed",
      "picture": "images/furniture/bed/b4.jpg",
      "old_price": 4000,
      "price": 3500,
    },
    {
      "name": "Bed",
      "picture": "images/furniture/bed/b5.jpg",
      "old_price": 7000,
      "price": 6000,
    },
    {
      "name": "Bed",
      "picture": "images/furniture/bed/b6.jpg",
      "old_price": 7000,
      "price": 6000,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown,
        title: Text('Beds'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),

      body: GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        }),  
    
     );
     
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                //here we are passing tthe values of the product to the product details page
                  builder: (context) => new ProductDetails(
                    product_detail_name: prod_name,
                    product_detail_new_price: prod_price,
                    product_detail_old_price: prod_old_price,
                    product_detail_picture: prod_picture,
                  ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: new Row(children: <Widget>[
                      Expanded(
                        child: Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                      ),

                      new Text("Rs.${prod_price}",style: TextStyle(color: Colors.red ),)
                    ],)
                  ),
                  child: Image.asset(prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
