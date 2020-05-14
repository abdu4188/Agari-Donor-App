import 'package:flutter/material.dart';

class PinDialog extends StatefulWidget{
  final method;
  PinDialog(this.method);

  @override
  State<StatefulWidget> createState() {
    return PinDialogState(method);
  }
}

class PinDialogState extends State<PinDialog>{
  final method;
  PinDialogState(this.method);

  @override
  Widget build(BuildContext context) {
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
                      "Please enter your $method pin number",
                      style: TextStyle(
                        color: Color(int.parse('0xff245a5a')),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Pin",
                      border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}