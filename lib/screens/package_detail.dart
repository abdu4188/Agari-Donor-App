import 'package:agari_doner/components/bottom_nav.dart';
import 'package:flutter/material.dart';

class PackageDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PackageDetailState();
  }
}

class PackageDetailState extends State<PackageDetail>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/header.jpg",
                    )
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 140,
                  child: Image.asset(
                    "assets/images/flour.jpg",
                    width: 130,
                    height: 170,
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 330,
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "2kg",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "RICE",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "3kg",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "FLOUR",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "2ltr",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "VEG OIL",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 110,
                  top: 410,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    color:  Color(int.parse('0xff00838f')),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                    onPressed: () => {
                      showDialog(
                        context: context,
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Dialog(
                            backgroundColor: Color(int.parse('0xff3fa1a9')),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            elevation: 20,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 16,
                                    left: 16,
                                    right: 16,
                                  ),
                                  margin: EdgeInsets.only(top: 16),
                                  decoration: BoxDecoration(
                                      color: Color(int.parse('0xff3fa1a9')),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(17),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 10,
                                            offset: Offset(0.0,10.0)
                                        )
                                      ]
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                          "Donation Options",
                                          style: TextStyle(
                                            color: Color(int.parse('0xff245a5a')),
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w700
                                          )
                                      ),
                                      SizedBox(height: 22.0),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          color: Color(int.parse('0xff245a5a')),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 35, right: 3, top: 20, bottom: 20),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  "In-kind",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Color(int.parse('0xff3fa1a9')),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 45,
                                                ),
                                                Icon(
                                                  Icons.help_outline,
                                                  color: Colors.white,
                                                  size: 35,
                                                ),
                                              ],
                                            )
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12,),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          color: Color(int.parse('0xff245a5a')),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 35, right: 3, top: 20, bottom: 20),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  "In-Cash",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Color(int.parse('0xff3fa1a9')),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Icon(
                                                  Icons.help_outline,
                                                  color: Colors.white,
                                                  size: 35,
                                                ),
                                              ],
                                            )
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ),
                        )
                      )
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNav()
    );
  }
}