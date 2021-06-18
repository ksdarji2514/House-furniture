import 'package:f3/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:f3/db/users.dart';



class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String gender;
  String groupValue = "male";  
  bool hidepass=true;
  bool loading = false;
  

   @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
         Image.asset(
           'images/bg1.jpg',
           fit: BoxFit.fill,
           width: double.infinity,
           height: double.infinity,
         ), 

          Container(
            color:Colors.black.withOpacity(0.8),
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
                          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color:Colors.white.withOpacity(0.4),
                            elevation:0.0 ,
                              child: Padding(
                                padding: const EdgeInsets.only(left:12.0),
                                child: TextFormField(
                                  controller: _nameTextController,
                                decoration: InputDecoration(
                                  hintText: "full name",
                                  icon: Icon(Icons.person_outline),
                                  border: InputBorder.none
                                ),
                                validator: (value){
                                  if(value.isEmpty){
                                    return "the name field cannot be empty";
                                  }
                                  
                                  return null;
                                }
                                
                                
                              ),
                            ),
                          ),
                        ), 
                        
                         Padding(
                           
                           padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                           child: new Container(
                          
                            color:Colors.white.withOpacity(0.2),
                            child: Material(
                               borderRadius: BorderRadius.circular(10.0),
                              color:Colors.white.withOpacity(0.3),
                              elevation:0.0 ,
                           
                              child: Row(
                                children: <Widget>[
                                  
                                  Expanded(child: ListTile(
                                    
                                    title: Text("male",
                                    textAlign:TextAlign.end,
                                    style:TextStyle(color:Colors.grey.shade800),
                                    ), 
                                      trailing:Radio(
                                        value: "male",
                                        groupValue: groupValue,
                                        onChanged: (e)=>ValueChanged(e)),
                                        )),

                                  Expanded(child: ListTile(
                                    title: Text("female",
                                    textAlign:TextAlign.end,
                                    style:TextStyle(color:Colors.grey.shade800),
                                    ), 
                                      trailing:Radio(
                                        value: "female",
                                        
                                        groupValue: groupValue,
                                        onChanged: (e)=>ValueChanged(e)),
                                        )),
                                  
                                ],
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
                                padding: const EdgeInsets.only(left:12.0),
                                child: TextFormField(
                                  controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                  border: InputBorder.none
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
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color:Colors.white.withOpacity(0.4),
                            elevation:0.0 ,
                              child: Padding(
                                padding: const EdgeInsets.only(left:0.0),
                                child: ListTile(
                                    title: TextFormField(
                                    controller: _confirmPasswordController,
                                    obscureText: hidepass,
                                  decoration: InputDecoration(
                                    hintText: "Confirm password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none
                                  ),
                                  validator: (value){
                                    if(value.isEmpty){
                                      return "the password field cannot be empty";
                                    }
                                    else if(value.length < 6){
                                      return "the password has to be atleast 6 characters long";
                                    }else if(_passwordTextController.text != value){
                                      return "the current password doesn't match";
                                    }
                                    return null;
                                  }
                                  
                                  
                                ),
                                trailing: IconButton(icon:Icon(Icons.remove_red_eye), onPressed: (){
                                  setState(() {
                                    hidepass=false;
                                  });
                                }),
                                
                              ),
                            ),
                          ),
                        ), 

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color:Colors.red.shade700,
                            elevation:0.0 ,
                              child: MaterialButton(
                                onPressed: () async{
                                   validateForm(); 

                              },
                              minWidth:MediaQuery.of(context).size.width,
                              child: Text("Sign Up",
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
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context); },
                                    child: Text(
                                      "Login ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.blue),
                                    ))),
                          ],
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

  ValueChanged(e) {
    setState(() {
      if(e=="male"){
        groupValue=e;
        gender=e;
      }else if(e=="female"){
        groupValue=e;
        gender=e;
      }
    });
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;
    

    if(formState.validate()){
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      if(user == null){
        firebaseAuth
        .createUserWithEmailAndPassword(
          email: _emailTextController.text, 
          password: _passwordTextController.text) 
        .then((Firebaseuser) =>{
           _userServices.createUser(
             
             {
               "username":_nameTextController.text,
               "email": _emailTextController.text,
               "userId": user.uid,
               "gender":gender,
               
               
               
             }
           )
          }).catchError((err) => {print(err.toString())});
           Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> HomePage()));
    
      }
    }
  }
}

