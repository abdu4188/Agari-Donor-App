import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register>{
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController repasswordController = new TextEditingController();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _phoneNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _rePasswordNode = FocusNode();
  var nameError;
  var phoneError;
  var passwordError;
  var rePasswordError;
  bool _hasCharacter = false;
  bool _hasNumber = false;
  bool registering = false;

  @override
    void initState(){
      super.initState();
      nameError = null;
      phoneError = null;
      passwordError = "";
      rePasswordError = null;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 35,
                  color: Colors.blue,
                  onPressed: () =>{
                    Navigator.of(context).pop()
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 48),
                child: Image.asset("assets/images/logo.png",height: 200.0,width:220.0,fit: BoxFit.cover,),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Let's Get Started!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Create an account to start donating and help others",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        focusNode: _nameNode,
                        decoration: InputDecoration(
                          labelText: "Full name",
                          prefixIcon: Icon(Icons.person),
                          hintText: "Enter your full name",
                          errorText: nameError
                        ),
                        onFieldSubmitted: (term){
                          _fieldFocusChange(context, _nameNode, _phoneNode);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        focusNode: _phoneNode,
                        decoration: InputDecoration(
                          labelText: "Phone number",
                          prefixIcon: Icon(Icons.phone),
                          hintText: "Enter your phone number",
                          errorText: phoneError
                        ),
                        onFieldSubmitted: (term){
                          _fieldFocusChange(context, _phoneNode, _passwordNode);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        focusNode: _passwordNode,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Enter password",
                        ),
                        onFieldSubmitted: (term){
                          _fieldFocusChange(context, _passwordNode, _rePasswordNode);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 5),
                        child: Text(
                          passwordError,
                          style: TextStyle(
                            color: Colors.red
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: repasswordController,
                        obscureText: true,
                        focusNode: _rePasswordNode,
                        decoration: InputDecoration(
                          labelText: "Reenter password",
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Reenter password",
                          errorText: rePasswordError
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 95),
                child: RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: registering ? Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ) :
                    Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () => {
                    FocusScope.of(context).requestFocus(new FocusNode()),
                    registerPressed()
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0, top: 25),
                child: Image.asset("assets/images/stripes.png",height: 240.0,width:130.0,fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 100),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Have an account already",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        "Login here",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18
                        ),
                      ),
                      onPressed: () => {
                        Navigator.of(context).pop()
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),      
        ],
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);  
  }

  registerPressed() async {
    if(nameController.text.isEmpty){
      setState(() {
        nameError = "Please enter your name";  
      });
    }
    else{
      setState(() {
        nameError = null;
      });
    }
    if(phoneController.text.isEmpty){
      setState(() {
        phoneError = "Please enter your phone number";
      });
    }
    else{
      setState(() {
        phoneError = null;
      });
    }
    if(passwordController.text.isEmpty){
      setState(() {
        passwordError = "Please enter your password";
      });
    }
    else{
      if(passwordController.text.length < 6){
        passwordError = "Password should be longer than 6 characters";
      }
      else{
        setState(() {
          passwordError = "";
        });
        var i = 0;
        var char = '';
        while( i < passwordController.text.length){
          char = passwordController.text.substring(i, i+1);
          if(isDigit(char, 0)){
            _hasNumber = true;
          }
          else{
            _hasNumber = false;
          }
          if(char == char.toLowerCase() || char == char.toUpperCase()){
            _hasCharacter = true;
          }
          else{
            _hasCharacter = false;
          }
          i++;
        }
        if(_hasCharacter && _hasNumber){
        }
        else{
          setState(() {
            passwordError = "Password should contain atleast one character and one number";
          });
        }
        if(_hasCharacter && _hasNumber){
          setState(() {
            passwordError = "";
          });
        }
      }
    }

    if(passwordController.text != repasswordController.text){
      setState(() {
        rePasswordError = "Passwords do not match";
      });
    }
    else{
      setState(() {
        rePasswordError = null;
      });
    }

    // all inputs are correct
    setState(() {
      registering = true;
    });
    http.Response response; 

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await createUser(nameController.text, phoneController.text, passwordController.text);

        Map<String, dynamic> rmap= jsonDecode(response.body);

        if(response.statusCode == 403){
          setState(() {
            registering = false;
          });
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                content: Text(
                  rmap['error']
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () => {Navigator.of(context).pop()},
                  )
                ],
              );
            }
          );
        }
        else if(response.statusCode == 200){
          setState(() {
            registering = false;
          });
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                content: Text(
                  "You have been registered sucessfully"
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pushReplacementNamed('/login')
                    },
                  )
                ],
              );
            }
          );
        }
        else{
          setState(() {
            registering = false;
          });
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                content: Text(
                  "Something went wrong, please try again."
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () => {
                      Navigator.of(context).pop()
                    },
                  )
                ],
              );
            }
          );
        }
      }
    } on SocketException catch (_) {
      setState(() {
        registering = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            content: Text(
              "You are not connected. Please connect to the internet and try again!"
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () => {Navigator.of(context).pop()},
              )
            ],
          );
        }
      );
    }
    


  }

  bool isDigit(String s, int idx) =>
        "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

  Future<http.Response> createUser(String name, String phone, String password){
    Map<String, String> body = {
      'name': name,
      'phone': phone,
      'password': password
    };

    return http.post(
      "https://agari-api.herokuapp.com/user/register/donor",
      body: body
    );
  }
}
