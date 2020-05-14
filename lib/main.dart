import 'package:agari_doner/screens/donation_confirmation.dart';
import 'package:agari_doner/screens/donation_history.dart';
import 'package:agari_doner/screens/home.dart';
import 'package:agari_doner/screens/package_detail.dart';
import 'package:flutter/material.dart';
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
      home: HomeScreen(),
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