
// import 'package:f3/pages/home.dart';
//import 'package:f3/pages/signup.dart';
import 'package:flutter/material.dart';

//==========================================================

import 'package:f3/pages/login.dart';
//import 'package:f3/pages/splash.dart';
//import 'package:provider/provider.dart'; 
//import 'package:f3/provider/user_provider.dart';
//import 'provider/user_provider.dart';


void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: Login(),
      )
  );
}
 /* runApp(ChangeNotifierProvider(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange
      ),
      home: ScreensController(),
    ), create: (BuildContext context) {},));
}
class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default: return Login();
    }
  }*/

