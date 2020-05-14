import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonationHistory extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DonationHistoryState();
  }
}

var donationHistory = [];
var formatter = new DateFormat('M EEEE y');
class DonationHistoryState extends State<DonationHistory>{
  @override
  void initState() {
    getDonationHistory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: <Widget>[
         Expanded(
            child: Stack(
             children: <Widget>[
               ClipRRect(
                 borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(20),
                   bottomRight: Radius.circular(20)
                 ),
                child: Container(
                   height: 280,
                   width: 320,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                       colors: [Color(int.parse('0xff75c8b7')), Color(int.parse('0xff3fa1a9')), Color(int.parse('0xff6cbbab'))]
                     ),
                   ),
                   child: Padding(
                     padding: EdgeInsets.only(top: 100, left: 180),
                     child: Column(
                       children: <Widget>[
                         Text(
                          "Donation",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          "History",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                       ],
                     )
                   ),
                 ),
               ),
               Positioned(
                 top: 200,
                 right: 0,
                 left: 0,
                 bottom: 0,
                 child: ListView.builder(
                   itemCount: donationHistory.length,
                   itemBuilder: (BuildContext context, index){
                     return Card(
                       color: Colors.white70,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(18)
                       ),
                       child: Row(
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                             child: Column(
                               children: <Widget>[
                                 Text(
                                   "Standard",
                                   style: TextStyle(
                                     fontSize: 25,
                                     fontWeight: FontWeight.w600,
                                     color: Color(int.parse('0xff3fa1a9'))
                                   ),
                                  ),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 ClipRRect(
                                   borderRadius: BorderRadius.circular(20),
                                   child: Container(
                                     color:  Color(int.parse('0xff3fa1a9')),
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(
                                         donationHistory[index]['status'],
                                         style: TextStyle(
                                           color: Colors.white
                                         ),
                                      ),
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 40),
                             child: Text(
                                DateFormat("M EEEE y").format(DateTime.parse(donationHistory[index]['created'])).toString(),
                               style: TextStyle(
                                 color: Color(int.parse('0xff3fa1a9')),
                                 fontSize: 17
                               ),
                            ),
                           )
                         ],
                       )
                     );
                   },
                 ),
               )
             ],
           ),
         ),
       ],
     ),
    //  bottomNavigationBar: BottomNav(2), 
    );
  }

  getDonationHistory() async{
    try{
        final result = await InternetAddress.lookup('google.com');

        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          var response;

          response = await http.get(
            "https://agari-api.herokuapp.com/donation/my",
            headers: {
              "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJiaW4iLCJzdWIiOiI1ZWEzMjk4NGIzNDQ2MTAwMTdmZjI1OWUiLCJpYXQiOjE1ODg2ODMzODE0NzB9.oXLix8lzlVNknYrpMRSy2FBgZRr551gq3knJxWtneLg"
            }
          );

          donationHistory = jsonDecode(response.body);
          print(donationHistory);
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