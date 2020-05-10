import 'package:agari_doner/components/bottom_nav.dart';
import 'package:flutter/material.dart';

class DonationHistory extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DonationHistoryState();
  }
}

class DonationHistoryState extends State<DonationHistory>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: PageView(
        children: <Widget>[
         Column(
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
                       itemCount: 16,
                       itemBuilder: (BuildContext context, index){
                         return Card(
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
                                             "Pending",
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
                                 padding: const EdgeInsets.only(left: 65),
                                 child: Text(
                                   "10 wed 2020",
                                   style: TextStyle(
                                     color: Color(int.parse('0xff3fa1a9')),
                                     fontSize: 20
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
       ],
     ),
     bottomNavigationBar: BottomNav(2), 
    );
  }
}