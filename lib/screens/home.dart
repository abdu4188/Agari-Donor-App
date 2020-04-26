import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    checkGeoPermission();
    super.initState();
  }

  String userId;

  @override
  Widget build(BuildContext context) {
    userId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Text("home"),
    );
  }

  http.Response response;

  sendPositionToAPI(currentPos) async {
    print("send to api");
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

          print(response.body);
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
    print("check permission");
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
        print("position$position");
        setState(() {
          _currentPosition = position;
        });
        print("then");
        sendPositionToAPI(_currentPosition);
      }
    ).catchError((e){
      print(e);
    });
  }
}