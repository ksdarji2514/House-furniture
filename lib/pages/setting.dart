import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SettingsOnePage extends StatelessWidget {
  static final String path ='lib/pages/setting.dart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Settings',style: TextStyle(color: Colors.black),),
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
                    color: Colors.brown,
                    child: ListTile(
                      onTap: (){},
                      //open edit profile
                      title: Text('Shivangi Lad',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500 ),),
                      leading: CircleAvatar(
                        child: Icon(Icons.person, color: Colors.white,),
                      ),
                      trailing: Icon(Icons.edit,color: Colors.white,),
                    ),
                  ),

                  const SizedBox(height:10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Column(children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.lock_outline,color: Colors.blueGrey,),
                        title: Text('Change password'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                      _buildDivider(),
                       ListTile(
                        leading: Icon(Icons.language ,color: Colors.blueGrey,),
                        title: Text('Change language'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                      _buildDivider(),
                       ListTile(
                        leading: Icon(Icons.location_on,color: Colors.blueGrey,),
                        title: Text('Change location'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){},
                      ),
                     ],
                    ),
                  ),
                  const SizedBox(height:20.0),
                  Text('Notification Settings',style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),),
                  
                  SwitchListTile(
                    activeColor: Colors.brown,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text('Received notification'),
                    onChanged: (val){},
                  ),
                   SwitchListTile(
                    activeColor: Colors.brown,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text('Received mails'),
                    onChanged: null,
                  ),
                   SwitchListTile(
                    activeColor: Colors.brown,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text('Received privacy details'),
                    onChanged: (val){},
                  ),
                   SwitchListTile(
                    activeColor: Colors.brown,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text('Received App Updates'),
                    onChanged: null,
                  ),
                   SwitchListTile(
                    activeColor: Colors.brown,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text('Received order details'),
                    onChanged: (val){},
                  ),
                  const SizedBox(height:60.0),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:Colors.brown,
                shape:BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom:00,
            left: 00,
            child: IconButton(
              icon:Icon(Icons.exit_to_app,color: Colors.white,),
              onPressed: (){
                //log out
              },
            ),
          ),
        ],
      ),
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