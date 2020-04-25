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
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: "Phone number",
                      hintText: "Enter your phone number",
                    ),
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

  loginClicked(){
    if(_loginKey.currentState.validate()){
      _scaffoldkey.currentState.showSnackBar(
        SnackBar(
          content: Text("Form valid"),
        )
      );
    }
  }
  
}