
import 'package:flutter/material.dart';
import 'package:flutter_web/pages/PageAbout.dart';
import 'package:flutter_web/pages/PageHome.dart';
import 'package:flutter_web/utiles/Strings.dart';

class RouteConfig {

  static const String pageHome = "/";
  static const String pageAbout = "/about";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('====${settings.name}');
    switch (settings.name) {
      case pageHome:
        return MaterialPageRoute(builder: (context) => PageHome(title: Strings.appTitle));
      case pageAbout:
        return MaterialPageRoute(builder: (context) => PageAbout());
      default:
        return MaterialPageRoute(builder: (context) => NotFindPage());
    }
  }
}

class NotFindPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}