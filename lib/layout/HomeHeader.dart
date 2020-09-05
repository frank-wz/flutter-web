import 'package:flutter/material.dart';
import 'package:flutter_web/utiles/Strings.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: buildHeader(),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[buildLogo(), buildHeaderLinks()],
    );
  }

  //Builds navigation links at the right top of landing page
  Widget buildHeaderLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: getLinksListing()..add(buildLoginButton()),
    );
  }

  //Builds navigation list for header
  List<Widget> getLinksListing() {
    var links = [Strings.homeBodyServices, Strings.homeBodyWork, Strings.homeBodyAbout];
    return links.map((link) {
      return Padding(
        padding: EdgeInsets.only(left: 22),
        child: Container(
          margin: EdgeInsets.only(left: 20),
          width: 120,
          height: 40,
          // decoration: BoxDecoration(
          // border: new Border.all(color: Colors.blue, width: 0.5), // 边色与边宽度
          // color: Colors.transparent, // 底色
          // //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
          // shape: BoxShape.rectangle, // 默认值也是矩形
          // borderRadius: new BorderRadius.circular((20.0)), // 圆角度
          // ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.blue],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    offset: Offset(0, 8), //Shadow starts at x=0, y=8
                    blurRadius: 8)
              ]),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Text(
                link,
                style: TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 1 ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  //Builds and decorates login button
  Widget buildLoginButton() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.blue],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    offset: Offset(0, 8), //Shadow starts at x=0, y=8
                    blurRadius: 8)
              ]),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Text(
                Strings.loginButton,
                style: TextStyle(
                    color: Colors.white, fontSize: 15, letterSpacing: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Builds rectangle with circular corners and Text on it and next to it as title
  Widget buildLogo() {
    return Row(
      children: <Widget>[
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.blue,
            // gradient: LinearGradient(
            //     colors: [Colors.blue, Colors.lightBlueAccent],
            //     begin: Alignment.bottomRight,
            //     end: Alignment.topLeft),
          ),
          child: Center(
            child: Text(
              Strings.logoTitle,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        //give some space between logo box and title
        SizedBox(
          width: 16,
        ),
        Text(
          Strings.appTitle,
          style: TextStyle(fontSize: 24, color: Colors.black),
        )
      ],
    );
  }
}