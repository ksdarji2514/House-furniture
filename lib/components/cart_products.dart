import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart=[
    {
      "name": "Cabinetry",
      "picture":"images/furniture/co1.jpg",

      "price": 1000,
      "size":"L",
      "color":"brown",
      "quantity":2,
    },
    {
      "name": "bed",
      "picture": "images/furniture/co4.jpg",
      "price": 5000,
      "size":"2",
      "color":"black",
      "quantity":1,
    },



  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index){
        return Single_cart_product(
          cart_prod_name: Products_on_the_cart[index]["name"],
          cart_prod_color: Products_on_the_cart[index]["color"],
          cart_prod_qty: Products_on_the_cart[index]["quantity"],
          cart_prod_size: Products_on_the_cart[index]["size"],
          cart_prod_price: Products_on_the_cart[index]["price"],
          cart_prod_picture: Products_on_the_cart[index]["picture"],
        );

      });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_color,
    this.cart_prod_price,
    this.cart_prod_picture,
    this.cart_prod_qty,
    this.cart_prod_size,
});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //================LEADING SECTION=============
        leading:  new Image.asset(cart_prod_picture,width: 80.0,
        height: 120.0,),

        //==========TITLE SECTION===========
        title: new Text(cart_prod_name),

        //=======SUBTITLE SECTION=====================
        subtitle: new Column(
          children: <Widget>[
            // ROW INSIDE THE COLUMN

            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_size,style: TextStyle(color:Colors.brown),),
                ),

                //========THIS SECTION IS FOR PRODUCT COLOR===========
                
                new Padding(padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text(cart_prod_color,style: TextStyle(color:Colors.brown),),
                ),
              ],
            ),
            
            //==========THIS SECTION IS FOR PRODUCT PRICE==================
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "Rs.${cart_prod_price}",
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                color: Colors.brown
                ),
              ),

            ),
          ],
        ),
        trailing: new Column(
          children: <Widget>[
           // new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
            new Text(" qty:$cart_prod_qty",),
            //new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})

          ],
        ),
      ),
    );
  }
}



