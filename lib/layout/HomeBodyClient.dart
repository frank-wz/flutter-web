import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utiles/Strings.dart';

class HomeBodyClient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[addBackground(), addWelcomeText()],
      ),
    );
  }

  //Adds background Image
  Widget addBackground() {
    return Container(
      // widthFactor: 1, //covers about 60% of the screen width
      color: Colors.lightBlue[50],
    );
  }

  //Adds welcome text
  Widget addWelcomeText() {
    return FractionallySizedBox(
      alignment: Alignment.center, //text aligned to center side
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
              Strings.homeBodyClient,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            //listview
            SizedBox(
              height: 50,
              child: new ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  new Image.asset(
                    "qq.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "wechat.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "google.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "facebook.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "tesla.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "qq.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "wechat.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "google.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "facebook.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "tesla.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "qq.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "wechat.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "google.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "facebook.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "tesla.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "qq.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "wechat.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "google.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "facebook.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "tesla.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "qq.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "wechat.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "google.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "facebook.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "tesla.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "qq.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "wechat.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "google.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "facebook.png",
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    "tesla.png",
                    fit: BoxFit.cover,
                  ),
                ],
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

class EmailBox extends StatelessWidget {
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
