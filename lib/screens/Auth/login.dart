import 'dart:convert';
import 'dart:io';
import 'package:agari_doner/components/custom_dialog.dart';
import 'package:agari_doner/screens/home.dart';
import 'package:agari_doner/string.dart';
import 'package:agari_doner/test_styles.dart';
import 'package:http/http.dart' as http;
import 'package:agari_doner/screens/Auth/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool logging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 0,left: 30, right:30, bottom: 30),
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 0,left: 10.0,bottom: 0.0,right: 10.0),
          child:Form(
              key: _loginKey,
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset("assets/images/nlogo.png",height: 250.0,width: 350.0,fit: BoxFit.cover,),
                      Text(Strings.MOTTO, style: TextStyles.mottoStyle)
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    focusNode: _phoneNode,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
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
                      prefixIcon: Icon(Icons.lock),
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
                      child: logging ?Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child:  CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )
                      ) :
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    color: Color(int.parse('0xff3fa1a9')),
                    onPressed: () => {
                      FocusScope.of(context).requestFocus(new FocusNode()),
                      loginClicked()
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
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
                        color: Color(int.parse('0xff3fa1a9')),
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
    setState(() {
      logging = true;
    });
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
          
          var jsonResponse;

          if(response.body == 'Unauthorized'){
            print(response.statusCode);
            setState(() {
              logging = false;
            });
            showDialog(
              context: context,
              builder: (BuildContext context){
                return CustomDialog(Strings.INPUT_ERROR, Strings.INVALID_CREDENTIAL, 1, 'assets/images/attention.png');
              }
            );
          }
          else{
            if(response.statusCode == 200){
              print(response.body);
              setState(() {
                logging = false;
              });
              jsonResponse = jsonDecode(response.body);
              addTokenToSF(jsonResponse['token']);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(id: jsonResponse['user']['_id']),
                )
              );
            }
            else{
              print(response.body);
              setState(() {
                logging = false;
              });
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return CustomDialog(Strings.OTHER_ERROR, Strings.OTHER_ERROR_DES, 1, 'assets/images/attention.png');
                }
              );
            }
          }
        }
      }
      on SocketException catch (_) {
        setState(() {
          logging = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context){
            return CustomDialog(Strings.CONNECTION_ERROR, Strings.CONNECTION_DES, 0, 'assets/images/attention.png');
          }
        );
      }
    }
    else{
      setState(() {
        logging = false;
      });
    }
  }
  addTokenToSF(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
  
}