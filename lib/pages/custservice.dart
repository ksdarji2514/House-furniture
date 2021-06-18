import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustService extends StatelessWidget {
  static final String path ='lib/pages/custservice.dart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
        title: Text('Customer Service',style: TextStyle(color: Colors.white),),
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
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.white,
                    child: ListTile(
                      
                    
                  
                      title: Text('Delay in Return Pickups:-\n \nTo priortise our customers most urgent needs,we have temporily stopped return pickups. While you need to initiate return as per the policy,the pickup timeline will be longer than usual.Learn More.',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400, ),),
                      
                      
                    ),
                  ),

                  const SizedBox(height:30.0),
                  Text("Do you need help with?\n",style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    
                  ),),
                  
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Column(children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.assignment_returned,color: Colors.brown,),
                        title: Text('Returns & Refunds'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                      _buildDivider(),
                       ListTile(
                        leading: Icon(Icons.payment ,color: Colors.brown,),
                        title: Text('LittleCloset Pay Transactions'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                      _buildDivider(),
                       ListTile(
                        leading: Icon(Icons.data_usage,color: Colors.brown,),
                        title: Text('Terms of use'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                     ],
                    ),
                  ),
                  const SizedBox(height:20.0),
                  Text('Need more help?',style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                   ListTile(
                        
                        title: Text('Browse all help topics'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                       ListTile(
                        
                        title: Text('Contact Us'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                  
        ],
      ),
    ),
        ],)
        );  
   }

  Container _buildDivider(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}