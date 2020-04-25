import 'package:flutter/material.dart';

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
  var nameError;
  var phoneError;
  var passwordError;
  var rePasswordError;
  bool _hasCharacter = false;
  bool _hasNumber = false;

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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.blue,
          onPressed: () =>{
            Navigator.of(context).pop()
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          Column(
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
                      decoration: InputDecoration(
                        labelText: "Full name",
                        icon: Icon(Icons.person),
                        hintText: "Enter your full name",
                        errorText: nameError
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone number",
                        icon: Icon(Icons.phone),
                        hintText: "Enter your phone number",
                        errorText: phoneError
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        icon: Icon(Icons.lock),
                        hintText: "Enter password",
                      ),
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
                      controller: repasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Reenter password",
                        icon: Icon(Icons.lock),
                        hintText: "Reenter password",
                        errorText: rePasswordError
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () => registerPressed(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
          )
        ],
      ),
    );
  }
  registerPressed(){
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
      if(passwordController.text.length < 8){
        passwordError = "Password should be longer than 8 characters";
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


  }

  bool isDigit(String s, int idx) =>
        "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;
}