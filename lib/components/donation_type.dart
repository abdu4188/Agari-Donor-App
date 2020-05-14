import 'package:agari_doner/screens/payment_option.dart';
import 'package:flutter/material.dart';


class DonationType extends StatefulWidget{
  final packageId;
  DonationType(this.packageId);

  @override
  State<StatefulWidget> createState() {
    return DonationTypeState(packageId);
  }
}

class DonationTypeState extends State<DonationType>{
  final packageId;
  DonationTypeState(this.packageId);
  @override
  Widget build(BuildContext context) {
    print(packageId);
    return Container(
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
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PaymentOption(packageId)
                          )
                        );
                      },
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
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}