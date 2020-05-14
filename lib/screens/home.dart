import 'dart:convert';
import 'dart:io';
import 'package:agari_doner/components/bottom_nav.dart';
import 'package:agari_doner/components/donation_type.dart';
import 'package:agari_doner/screens/package_detail.dart';
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

var packages = [];
bool packagesLoaded = false;
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
    getPackages();
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

        print(response.body);
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

  getPackages() async{
    try{
        final result = await InternetAddress.lookup('google.com');

        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){

          response = await http.get(
            "https://agari-api.herokuapp.com/donation/packages",
            headers: {
              "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJiaW4iLCJzdWIiOiI1ZWEzMjk4NGIzNDQ2MTAwMTdmZjI1OWUiLCJpYXQiOjE1ODg2ODMzODE0NzB9.oXLix8lzlVNknYrpMRSy2FBgZRr551gq3knJxWtneLg"
            }
          );

          if(jsonDecode(response.body).length > 0){
            if(this.mounted){
              setState(() {
                packages = jsonDecode(response.body);
                print(packages);
                packagesLoaded = true;
              });
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

  String userId;

  @override
  Widget build(BuildContext context) {
    userId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: packagesLoaded ? Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/images/header.jpg")
                  )
                ),
                Positioned(
                  top: 100,
                  right: 150,
                  child: Text('''
                  Donation
                  Packages''',
                  style: TextStyle(
                    color:  Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  )
                ),
                Positioned(
                  top: 180,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 245.0,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: packages.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PackageDetail(),
                                settings: RouteSettings(
                                  arguments: packages[index]
                                )
                              )
                            )
                          },
                          child: Container(
                            width: 250,
                            child: Stack(
                              children: <Widget>[
                                Text(
                                  packages[index]['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  child: SizedBox(
                                    width: 200,
                                    height: 230,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      color: Color(int.parse('0xff00838f')),
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(17),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white
                                            ),
                                            child: Text(
                                              "200 birr",
                                              style: TextStyle(
                                                color: Colors.green
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 50,
                                  child: Container(
                                    width: 80,
                                    margin: EdgeInsets.only(left: 100, top: 100, bottom: 50,right: 100),
                                    padding: EdgeInsets.only(top: 60),
                                    height: 150,
                                    child: ListView.builder(
                                     itemCount: packages[index]['details'].length,
                                     itemBuilder: (BuildContext context, indext){
                                       return Text(packages[index]['details'][indext],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      );
                                     }, 
                                    )
                                  ),
                                ),
                                Positioned(
                                  left: 150,
                                  child: Image.asset(
                                    'assets/images/flour.jpg',
                                    width: 100,
                                    height: 200,
                                  ),
                                ),
                                Positioned(
                                  left: 120,
                                  top: 80,
                                  child: Image.asset(
                                    'assets/images/oil.jpg',
                                    width: 70,
                                    height: 100,
                                  ),
                                ),
                                Positioned(
                                  top: 190,
                                  left: 60,
                                  child: RaisedButton(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)
                                  ),
                                  color:  Color(int.parse('0xff3fa1a9')),
                                  child: Text(
                                    "Donate",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  onPressed: () => {
                                    showDialog(
                                      context: context,
                                      child: DonationType(packages[index]['_id'])
                                    )
                                  },
                                ),
                                )
                              ],
                            ),
                          ),
                        );                      
                      }, 
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ) : Center(child: CircularProgressIndicator()),
      bottomNavigationBar: BottomNav(0)
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