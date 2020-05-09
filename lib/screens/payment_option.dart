import 'package:agari_doner/components/bottom_nav.dart';
import 'package:flutter/material.dart';

class PaymentOption extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PaymentOptionState();
  }
}

class PaymentOptionState extends State<PaymentOption> with TickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 240, top: 30,),
            child: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                size: 35,
                color: Color(int.parse('0xff00838f')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 25),
            child: Text(
              "Payment Options",
              style: TextStyle(
                color: Color(int.parse('0xff00838f')),
                fontSize: 25,
                fontWeight: FontWeight.w700
              ), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TabBar(
              controller: _tabController,
              labelColor: Color(int.parse('0xff00838f')),
             tabs: <Widget>[
               Tab(
                 text: "USSD",
               ),
               Tab(
                 text: "Mobile Banking",
               ),
               Tab(
                 text: "Deposit",
               ),
             ], 
            ),
          ),
          Container(
            height: 290,
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Card(
                        color: Color(int.parse('0xff6cbbab')),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/cbe.png',
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Donate 500 birr using CBE",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(int.parse('0xff00838f')),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Card(
                        color: Color(int.parse('0xff6cbbab')),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/amole.jpg',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Donate 500 birr using AMOLE",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(int.parse('0xff00838f')),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Card(
                        color: Color(int.parse('0xff6cbbab')),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/hellocash.jpg',
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Donate 500 birr using HELLO CASH",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(int.parse('0xff00838f')),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
                ListView(
                  children: <Widget>[
                    Text("Mobile Banking")
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Text("Deposit")
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  
}