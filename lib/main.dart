import 'package:agari_doner/screens/donation_confirmation.dart';
import 'package:agari_doner/screens/donation_history.dart';
import 'package:agari_doner/screens/home.dart';
import 'package:agari_doner/screens/package_detail.dart';
import 'package:agari_doner/screens/payment_option.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'components/custom-widget.dart';
import 'screens/Auth/register.dart';
import 'screens/Auth/login.dart';

void main() => runApp(Home());

final navigatorKey = GlobalKey<NavigatorState>();
Map<int, Color> color =
{
50:Color(int.parse('0xff3fa1a9')),
100:Color(int.parse('0xff3fa1a9')),
200:Color(int.parse('0xff3fa1a9')),
300:Color(int.parse('0xff3fa1a9')),
400:Color(int.parse('0xff3fa1a9')),
500:Color(int.parse('0xff3fa1a9')),
600:Color(int.parse('0xff3fa1a9')),
700:Color(int.parse('0xff3fa1a9')),
800:Color(int.parse('0xff3fa1a9')),
900:Color(int.parse('0xff3fa1a9'))
};
class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Agari Donor',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff3fa1a9, color)
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
      '/login': (BuildContext context) => new Login(),
      '/register': (BuildContext context) => new Register(),
      '/home': (BuildContext context) => new HomeScreen(),
      '/package_detail': (BuildContext context) => new PackageDetail(),
      '/donation_history': (BuildContext context) => new DonationHistory(),
      '/comfirm_donation': (BuildContext context) => new DonationConfirmation(),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      DonationHistory(),
      PaymentOption("1"),
      HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          size: 30,
        ),
        title: ("Home"),
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.add,
          size: 30,
        ),
        title: ("add"),
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
          size: 30,
        ),
        title: ("profile"),
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.help,
          size: 30,
        ),
        title: ("help"),
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        navBarCurve: NavBarCurve.upperCorners,
        controller: _controller,
        screens: _buildScreens(),
        items:
            _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
        confineInSafeArea: true,
        backgroundColor: Color(int.parse('0xff00838f')),
        handleAndroidBackButtonPress: true,
        onItemSelected: (int) {
          setState(
              () {}); // This is required to update the nav bar if Android back button is pressed
        },
        customWidget: CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller.index,
        ),
        itemCount: 4,
        navBarStyle:
            NavBarStyle.neumorphic // Choose the nav bar style with this property
        );
  }
}