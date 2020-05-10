import 'package:flutter/material.dart';

int currentIndex;
class BottomNav extends StatefulWidget{
  BottomNav(index){
    currentIndex = index;
  }
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
    else if(index == 1){
      Navigator.of(context).pushNamed('/comfirm_donation');
    }
    else if(index == 2){
      Navigator.of(context).pushNamed('/donation_history');
    }
    else if(index == 3){
      Navigator.of(context).pushNamed('/payment_option');
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
          currentIndex: currentIndex,
          selectedIconTheme: IconThemeData(
            color: Colors.white
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black26
          ),
          backgroundColor: Color(int.parse('0xff00838f')),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.help,
                size: 30,
              ),
              title: Text(""),
            ),
          ],
        ),
      );
  }
}