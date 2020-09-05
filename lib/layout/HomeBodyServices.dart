import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utiles/Strings.dart';

import 'card.dart';

class HomeBodyServices extends StatelessWidget {
  var backgroundImage = "assets/service_background.jpg";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment(-1, -1),
        overflow: Overflow.visible,
        children: <Widget>[
          addBackground(),
          Column(
            children: <Widget>[
              addWelcomeText(context),
              addHomeBodyServicesCard(context),
            ],
          ),
        ],
      ),
    );
  }

  //Adds background Image
  Widget addBackground() {
    return Container(
      // widthFactor: 1, //covers about 60% of the screen width
      color: Colors.white,
      // child: Image.network(
      //   backgroundImage,
      //   scale: 1,
      // ),
    );
  }

  Widget addHomeBodyServicesCard(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 96, right: 96),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CardLayout(Strings.homeServiceTitleA, Strings.homeServiceSubA, "mdesign.png"),
            CardLayout(Strings.homeServiceTitleB, Strings.homeServiceSubB, "mdev.png"),
            CardLayout(Strings.homeServiceTitleC, Strings.homeServiceSubC, "webdev.png"),
          ],
        ));
  }

  //Adds welcome text
  Widget addWelcomeText(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center, //text aligned to center side
      // widthFactor: .7, //covers about half of the screen
      child: Padding(
        padding: EdgeInsets.only(left: 48, right: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              Strings.homeBodyServices,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(
                  text: Strings.hello,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: Strings.welcomeTo,
                      style: TextStyle(
                          fontSize: 25, color: Colors.lightBlueAccent),
                    ),
                    TextSpan(
                        text: Strings.ftf,
                        style: TextStyle(fontSize: 25, color: Colors.black54))
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Strings.homeBodyServicesContent,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 20,
            ), //Give some spacing
          ],
        ),
      ),
    );
  }
}

List<Widget> getServicesCardListing() {
  var links = [
    Strings.homeBodyServices,
    Strings.homeBodyWork,
    Strings.homeBodyAbout
  ];
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
              style: TextStyle(
                  color: Colors.white, fontSize: 15, letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }).toList();
}

class buildServicesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.0, right: 74, top: 10, bottom: 40),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: Strings.email_hint),
                ),
              ),
              Expanded(
                flex: 2,
                child: SubscribeButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubscribeButton extends StatelessWidget {
  var emailImage = "assets/email.png";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.blue.withOpacity(.3),
                  offset: Offset(0, 8),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {}, //TODO
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Strings.subscribeButton,
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 1),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Image.network(
                    emailImage,
                    color: Colors.white,
                    width: 20,
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
