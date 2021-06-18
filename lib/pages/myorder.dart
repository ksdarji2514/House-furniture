import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class MyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
        title: Text('My Orders',style: TextStyle(color: Colors.white),),
      ),
       body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(5.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                   Text('Your orders:',style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),),
                  ListTile(
                        leading: Icon(Icons.search,color: Colors.brown,),
                        title: Text('Search all orders.'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                       ListTile(
                        leading: Icon(Icons.card_travel,color: Colors.brown,),
                        title: Text('Shipping'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                      Divider(thickness: 5,),
                      ListTile(
                        title: Text('Last 6 months',style: TextStyle(fontSize: 20.0),),
                        onTap: (){},
                      ),
                      
                       Text('No orders or transactions found.Please select a different time period or order type.',
                        textAlign: TextAlign.center,),
                        
                      

                   ],    
            ),
          ),
        ],
      ),
    );
  }
}