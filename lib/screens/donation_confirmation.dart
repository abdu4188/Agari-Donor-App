import 'package:flutter/material.dart';

class DonationConfirmation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DonationConfirmationState();
  }
}

class DonationConfirmationState extends State<DonationConfirmation>{
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
                   height: 220,
                   width: 320,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                       colors: [Color(int.parse('0xff75c8b7')), Color(int.parse('0xff3fa1a9')), Color(int.parse('0xff6cbbab'))]
                     ),
                   ),
                   child: Column(
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(right: 250, top: 30, bottom: 10 ),
                         child: GestureDetector(
                           onTap: () => {
                             Navigator.of(context).pop()
                           },
                            child: Icon(
                             Icons.arrow_back,
                             color: Colors.white,
                             size: 35,
                           ),
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top: 0, right: 180),
                         child: Column(
                           children: <Widget>[
                             Text(
                              "Standard",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(
                              "Donation",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                           ],
                         )
                       ),
                       Padding(
                         padding: const EdgeInsets.only(right: 50),
                         child: Text(
                            "Please drop this donation at",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),
                        ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 15),
                         child: Row(
                           children: <Widget>[
                             Icon(
                               Icons.location_on,
                               color: Color(int.parse('0xff6cbbab')),
                             ),
                             Text(
                               "Go to location",
                               style: TextStyle(
                                 color: Color(int.parse('0xff6cbbab')),
                                 fontSize: 17
                               ),
                            )
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               ),
               Positioned(
                 top: 230,
                 left: 0,
                 bottom: 0,
                 right: 0,
                 child: SizedBox(
                   width: 400,
                    child: ListView(
                      shrinkWrap: true,
                     children: <Widget>[
                       Column(
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.only(left: 20, top: 0),
                             child: Text(
                              "Once you arrive, Please show this QR code to the store owner.",
                              style: TextStyle(
                                color: Color(int.parse('0xff3fa1a9')),
                                fontSize: 17
                              ), 
                             ),
                           ),
                           Image.asset(
                             'assets/images/qr.png',
                             width: 150,
                             height: 150,
                           ),
                           SizedBox(
                             width: 250,
                             child: Padding(
                               padding: const EdgeInsets.only(right: 100),
                               child: Column(
                                 children: <Widget>[
                                   Text(
                                     "Donation Details",
                                     style: TextStyle(
                                       color: Color(int.parse('0xff3fa1a9')),
                                       fontSize: 18,
                                       fontWeight: FontWeight.w600
                                     ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "2 liter veg oil",
                                            style: TextStyle(
                                              color: Color(int.parse('0xff3fa1a9')),
                                              fontSize: 17
                                            ),
                                          ),
                                          Text(
                                            "3 Kilo rice",
                                            style: TextStyle(
                                              color: Color(int.parse('0xff3fa1a9')),
                                              fontSize: 17
                                            ),
                                          ),
                                          Text(
                                            "2 Kilo flour",
                                            style: TextStyle(
                                              color: Color(int.parse('0xff3fa1a9')),
                                              fontSize: 17
                                            ),
                                          ),
                                          RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                            ),
                                            color: Color(int.parse('0xff3fa1a9')),
                                            child: Text(
                                              "Cancel Donation",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13
                                              ),
                                            ),
                                            onPressed: () => {},
                                          )
                                        ],
                                      ),
                                    )
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               )
              ],
            ),
          )
        ],
      ), 
    );
  }
}