import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
        title: Text('Legal & About',style: TextStyle(color: Colors.white),),
      ),

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Card(
                    
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.white,
                    child: ListTile(
                        title: Text('LittleCloset App\nversion 18.21.2.300\nBuild 18.0.2378.0\n\n2019-2020 , LittleCloset ,Inc. or \nits affliates',
                            textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                           ),),
                           
                      ),
                    ),
                    Divider(),
                    ListTile(
                        
                        title: Text('Legal Information'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                      Divider()
                  ],
           ),
          ),
        ],
       ),
      );
  }
}