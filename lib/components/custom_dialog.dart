import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {

  final String title, discription, image;
  final int index;

  CustomDialog(this.title, this.discription, this.index, this.image);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, image),
    );
  }

  dialogContent(BuildContext context, String image){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
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
                  title,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700
                  )
              ),
              SizedBox(height: 12.0),
              Text(
                  discription,
                  style: TextStyle(
                      fontSize: 16.0
                  )
              ),
              SizedBox(height: 20.0),
              Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Close"),
                  )
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 14,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: Image.asset(image, width: 50.0,height: 50.0,),
          ),
        ),
      ],
    );
  }
}