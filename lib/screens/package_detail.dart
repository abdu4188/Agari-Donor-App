import 'package:flutter/material.dart';

class PackageDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PackageDetailState();
  }
}
var packageDetail = {};
class PackageDetailState extends State<PackageDetail>{
  @override
  Widget build(BuildContext context) {
    packageDetail = ModalRoute.of(context).settings.arguments;
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
                        Container(
                          height: 100,
                          width: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: packageDetail['details'].length,
                            itemBuilder: (BuildContext context, index){
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      packageDetail['details'][index],
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 380,
                  child: Column(
                    children: <Widget>[
                      Text(
                        packageDetail['description'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(int.parse('0xff00838f'))
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 110,
                  top: 430,
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
    );
  }
}