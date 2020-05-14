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