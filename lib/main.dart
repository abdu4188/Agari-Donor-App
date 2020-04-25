import 'package:flutter/material.dart';
import 'screens/Auth/register.dart';
import 'screens/Auth/login.dart';

void main() => runApp(Home());

final navigatorKey = GlobalKey<NavigatorState>();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Agari Donor',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Login(),
      routes: <String, WidgetBuilder>{
      '/login': (BuildContext context) => new Login(),
      '/register': (BuildContext context) => new Register()
      },
    );
  }
}