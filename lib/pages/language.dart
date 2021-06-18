import 'package:flutter/material.dart';

class Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
        title: Text('Language',style: TextStyle(color: Colors.white),),
      ),

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(5.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                   Text('Choose your preferred language',style:TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),),
                  const SizedBox(height:20.0),

                  Card(
                     elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                       child: Column(children: <Widget>[

                    SwitchListTile(
                      activeColor: Colors.brown,
                      contentPadding: const EdgeInsets.all(0),
                      value: true,
                      title: Text('   English',style: TextStyle(
                        fontWeight: FontWeight.w500,),),
                      onChanged: (val){},
                    ),
                    Divider(thickness: 1.5,),
                    SwitchListTile(
                      activeColor: Colors.brown,
                      contentPadding: const EdgeInsets.all(0),
                      value: true,
                      title: Text('   Hindi',style: TextStyle(
                        fontWeight: FontWeight.w500,),),
                      onChanged: null,
                    ),
                  ]
                ),
              ),
                   
                  const SizedBox(height:30.0),
                  Text(' Language options can be changed anytime.We will translate information to help you browse,shop and communicate.We are continously improving the Hindi language experiance on LittleCloset.Please note that translations are provided for convinience only and the English version of LittleCloset,including our conditions of Use,is the definitive version.',
                  style:TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  ),
               ],
            ),
          ), 
        ],
      ),

    );
  }
}