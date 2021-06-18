import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f3/pages/home.dart';

import 'package:f3/pages/signup.dart';


class Login extends StatefulWidget {  
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SharedPreferences preferences;
  bool loading = false;
  
  bool isLogedin = false;
  bool hidepass=true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

Future<FirebaseUser> _signIn(BuildContext context) async {
  
   Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text('Sign in'),
        ));

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

  final FirebaseUser userDetails = await firebaseAuth.currentUser();
  ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
        userDetails.providerId,
        userDetails.displayName,
        userDetails.photoUrl,
        userDetails.email,
        providerData,
);
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new HomePage(),
      ),
    );
    return userDetails;
  }  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
           ListTile(
            title:Text("Sign UP",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),),
           ),
                                    
          Image.asset(
           'images/bg1.jpg',
           fit: BoxFit.fill,
           width: double.infinity,
           height: double.infinity,
         ), 

         
          Container(
            color:Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),

              
              Padding(
                padding: const EdgeInsets.only(top:200.0),
                child: Center(
                  child:Form(
                    key: _formKey,
                     child:ListView(
                       children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color:Colors.white.withOpacity(0.4),
                            elevation:0.0 ,
                              child: Padding(
                                padding: const EdgeInsets.only(left:12.0),
                                child: TextFormField(
                                  controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                ),
                                
                                validator: (value) {
                                  if (value.isEmpty) {
                                      Pattern pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                  }
                                }
                              ),
                            ),
                          ),
                        ), 

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color:Colors.white.withOpacity(0.4),
                            elevation:0.0 ,
                              child: Padding(
                                padding: const EdgeInsets.only(left:0.0),
                                child: ListTile(
                                    title: TextFormField(
                                    controller: _passwordTextController,
                                    obscureText: hidepass,
                                  decoration: InputDecoration(
                                    hintText: "password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none
                                  ),
                                  validator: (value){
                                    if(value.isEmpty){
                                      return "the password field cannot be empty";
                                    }
                                    else if(value.length < 6){
                                      return "the password has to be atleast 6 characters long";
                                    }
                                    return null;
                                  }
                                  
                                  
                                ),
                                trailing: IconButton(
                                  icon:Icon(Icons.remove_red_eye),
                                   onPressed: (){
                                  setState(() {
                                    hidepass=false;
                                  });
                                }),
                              ),
                              
                            ),
                          ),
                        ), 

                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color:Colors.red.withOpacity(0.8),
                            elevation:0.0 ,
                              child: MaterialButton(onPressed: (){
                                    HomePage();

                              },
                              minWidth:MediaQuery.of(context).size.width,
                              child: Text("Login",
                              style: TextStyle(
                                color:Colors.white, 
                                fontWeight:FontWeight.bold,
                                fontSize: 22.0),
                                ),
                            )
                          ),
                          ),
                         // Container(),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Forgot password",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Signup()));
                                    },
                                    child: Text(
                                      "Sign UP",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ))),
                          ],
                        ),
                          Divider(color: Colors.white),
                            Text("other login option",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold),textAlign:TextAlign.center),
                          Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color:Colors.indigoAccent.shade200.withOpacity(0.8),
                            elevation:0.0 ,
                              child: MaterialButton(onPressed: (){
                                HomePage();
                              },
                              minWidth:MediaQuery.of(context).size.width,
                              child: Text("google",
                              style: TextStyle(color:Colors.white, fontWeight:FontWeight.bold,fontSize: 22.0),),
                            )
                          ),
                          ),         
                       ],
                     )),
                ),
              ),
            
          
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color:Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),

      
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}


class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
