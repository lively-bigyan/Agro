import 'package:agro/screens/onboardingscreen.dart';
import 'package:agro/sharedloginregister.dart';
import 'dart:async';
import 'router_constants.dart';
import 'package:flutter/material.dart';
import 'router.dart' as router;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class Splash extends StatefulWidget {
@override
SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => Login()));
    } else {
    prefs.setBool('seen', true);
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => OnboardingScreen()));
    }
}

@override
void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
    checkFirstSeen();
    });
}

@override
Widget build(BuildContext context) {
    return new Scaffold(
    body: new Center(
        child: new Text('Loading...'),
    ),
    );
}
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Abel',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xff545F55),
      primaryColor: Color(0xff545F55),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: SplashRoute, 
    );
  }
}