

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utiles/Strings.dart';

class HomeBodyWork extends StatelessWidget {

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
              addWelcomeText(),
              addHomeBodyProjectCard(context),
            ],
          ),
        ],
      ),
    );
  }

  //Adds background Image
  Widget addBackground() {
    return Container(
      color: Colors.lightBlueAccent,
    );
  }

  //Adds welcome text
  Widget addWelcomeText() {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft, //text aligned to left side
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
              Strings.homeBodyWorkTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Strings.homeBodyWorkSubTitle,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget addHomeBodyProjectCard(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 96, right: 96),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ProjectLayout(Strings.homeProTitleA, Strings.homeProSubA, "pro01.jpeg"),
            ProjectLayout(Strings.homeProTitleB, Strings.homeProSubB, "pro02.jpg"),
            ProjectLayout(Strings.homeProTitleC, Strings.homeProSubC, "pro03.jpeg"),
          ],
        ));
  }
}

class EmailBox extends StatelessWidget{
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

class ProjectLayout extends StatelessWidget {
  const ProjectLayout(this.title, this.subTitle, this.image);

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        width: 325,
        child: Card(
            clipBehavior: Clip.antiAlias,
            // 根据设置裁剪内容
            color: Colors.white70,
            //  卡片背景颜色
            elevation: 10.0,
            // 卡片的z坐标,控制卡片下面的阴影大小
            margin: EdgeInsets.all(10.0),
            //  margin: EdgeInsetsDirectional.only(bottom: 30.0, top: 30.0, start: 30.0),// 边距
            semanticContainer: true,
            // 表示单个语义容器，还是false表示单个语义节点的集合，接受单个child，但该child可以是Row，Column或其他包含子级列表的widget
//      shape: Border.all(
//          color: Colors.indigo, width: 1.0, style: BorderStyle.solid), // 卡片材质的形状，以及边框
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            // 圆角
            //borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Column(
                //card里面的子控件
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  new Image.asset(
                    image,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 18.0)),
                ],
              ),
            )));
  }
}