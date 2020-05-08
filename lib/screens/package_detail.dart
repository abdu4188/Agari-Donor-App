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
                  left: 120,
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
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
}