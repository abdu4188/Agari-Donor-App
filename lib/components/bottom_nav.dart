import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BottomNavState();
  }
}

class BottomNavState extends State<BottomNav>{

  void bottomNaviagationTapped(int index){
    if(index == 0){
      Navigator.of(context).pushNamed('/home');
    }
    if(index == 1){
      Navigator.of(context).pushNamed('/comfirm_donation');
    }
    if(index == 2){
      Navigator.of(context).pushNamed('/donation_history');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          onTap: bottomNaviagationTapped,
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
      );
  }
}