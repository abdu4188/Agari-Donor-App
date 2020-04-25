import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:agari_doner/screens/Auth/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login>{
  final _loginKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final FocusNode _phoneNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Form(
              key: _loginKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    focusNode: _phoneNode,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: "Phone number",
                      hintText: "Enter your phone number",
                    ),
                    onFieldSubmitted: (term){
                      _fieldFocusChange(context, _phoneNode, _passwordNode);
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return "Please enter your phone number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    focusNode: _passwordNode,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Password",
                      hintText: "Enter your password",
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    color: Colors.blue,
                    onPressed: () => loginClicked(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Don't have an account yet?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  FlatButton(
                    color: Colors.transparent,
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17
                      ),
                    ),
                    onPressed: ()=> {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Register()
                        )
                      )
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);  
  }

  http.Response response; 

  loginClicked() async {
    if(_loginKey.currentState.validate()){
      try{
        final result = await InternetAddress.lookup('google.com');

        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){

          Map<String, String> body = {
            'phone': phoneController.text,
            'password': passwordController.text
          };

          response = await http.post(
            "https://agari-api.herokuapp.com/user/signin/donor",
            body: body
          );



          if(response.body == 'Unauthorized'){
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  content: Text(
                    "The phone number or password you entered are incorrect."
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
          else{
            if(response.statusCode == 200){
              _scaffoldkey.currentState.showSnackBar(
                SnackBar(
                  content: Text("Successful")
                )
              );
            }
            else{
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
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
        }
      }
      on SocketException catch (_) {
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
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
  }
  
}