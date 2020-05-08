import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  } 
}

enum PermissionGroup {
  /// Android: Fine and Coarse Location
  /// iOS: CoreLocation - Always
  locationAlways,

  /// Android: Fine and Coarse Location
  /// iOS: CoreLocation - WhenInUse
  locationWhenInUse
}

class HomeState extends State<HomeScreen>{

  Position _currentPosition;
  @override
  void initState() {
    checkLogin();
    super.initState();
  }
  
  checkIfLocationSent(token) async{
    try{
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){

        response = await http.post(
          "https://agari-api.herokuapp.com/user/current",
          headers: {
            "Authorization": token
          }
        );

        var jsonResponse = jsonDecode(response.body);

        if(jsonResponse['location'] == null){
          checkGeoPermission();
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

  checkGeoPermission() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    var geolocationStatus = await Geolocator().isLocationServiceEnabled();
    if(!geolocationStatus){
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text(
              "Location services is turned off. Please go to your settings, turn it on and login again!"
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () => {
                  Navigator.of(context).pop(),
                  Navigator.of(context).pop(),
                },
              )
            ],
          );
        }
      );
    }

    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then(
      (Position position){
        setState(() {
          _currentPosition = position;
        });
        sendPositionToAPI(_currentPosition);
      }
    ).catchError((e){
      print(e);
    });
  }


  checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool tokenCheck = prefs.containsKey('token');
    if(!tokenCheck){
      Navigator.of(context).pushReplacementNamed('/login');
    }
    else{
      String token = prefs.getString('token');
      checkIfLocationSent(token);
    }
  }

  String userId;

  @override
  Widget build(BuildContext context) {
    userId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Text("home"),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Color(int.parse('0xff00838f')),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.help,
                size: 30,
                color: Colors.white,
              ),
              title: Text(""),
            ),
          ],
        ),
      ),
    );
  }

  http.Response response;

  sendPositionToAPI(currentPos) async {
    try{
        final result = await InternetAddress.lookup('google.com');

        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){

          Map<String, String> body = {
            'lat': currentPos.latitude.toString(),
            'lon': currentPos.longitude.toString()
          };

          response = await http.post(
            "https://agari-api.herokuapp.com/user/location/$userId",
            body: body,
            headers: {
              "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJiaW4iLCJzdWIiOiI1ZWEzMjk4NGIzNDQ2MTAwMTdmZjI1OWUiLCJpYXQiOjE1ODc3NTEzMDA5MDl9.U8xJ-EcAkZtMGK5Mzj29K8sMUsxLb98kpU15cqpQqv0"
            }
          );
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