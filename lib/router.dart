import 'package:agro/main.dart';
import 'package:agro/router_constants.dart';
import 'package:agro/sharedloginregister.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name)
  {
    case SplashRoute:
    return MaterialPageRoute(builder: (context)=>Splash());
    case LoginRoute:
    return MaterialPageRoute(builder: (context)=>Login());
    default:
    return MaterialPageRoute(builder: (context)=>Login());
  }
}