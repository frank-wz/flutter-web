// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utiles/Strings.dart';

const String _kAssetsPackage = 'assets';

enum CardType {
  standard,
  tappable,
  selectable,
}

class CardItems {
  const CardItems({
    @required this.assetName,
    @required this.assetPackage,
    @required this.title,
    @required this.description,
    this.type = CardType.standard,
  })  : assert(assetName != null),
        assert(assetPackage != null),
        assert(title != null),
        assert(description != null);

  final String assetName;
  final String assetPackage;
  final String title;
  final String description;
  final CardType type;
}

List<CardItems> servicesCardList(BuildContext context) => [
  CardItems(
    assetName: 'places/india_thanjavur_market.png',
    assetPackage: _kAssetsPackage,
    title:
    "Mobile App Design",
    description: "Lay a strong foundation for your digital apps with a neat and useable design",
  ),
  CardItems(
    assetName: 'places/india_chettinad_silk_maker.png',
    assetPackage: _kAssetsPackage,
    title: "Mobile App Development",
    description: "Get mobile applications developed for your start-ups, businesses, and enterprise",
    type: CardType.tappable,
  ),
  CardItems(
    assetName: 'places/india_tanjore_thanjavur_temple.png',
    assetPackage: _kAssetsPackage,
    title: "Web App Development",
    description: "Have web applications (CMS, Responsive websites, and more) developed to compliment your mobile apps.",
    type: CardType.selectable,
  ),
];

class CardItem extends StatelessWidget {
  const CardItem({Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 200.0;
  final CardItems destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(
                title:Strings.appTitle
                ),
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: CardItemContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TappableCardItem extends StatelessWidget {
  const TappableCardItem(
      {Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 298.0;
  final CardItems destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(
                title: Strings.appTitle),
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {
                    print('Card was tapped');
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: CardItemContent(destination: destination),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectableCardItem extends StatefulWidget {
  const SelectableCardItem(
      {Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  final CardItems destination;
  final ShapeBorder shape;

  @override
  _SelectableCardItemState createState() =>
      _SelectableCardItemState();
}

class _SelectableCardItemState
    extends State<SelectableCardItem> {
  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 298.0;
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(
                title: Strings.appTitle),
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: widget.shape,
                child: InkWell(
                  onLongPress: () {
                    print('Selectable card state changed');
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor: colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Container(
                        color: _isSelected
                        // Generally, material cards use primary with 8% opacity for the selected state.
                        // See: https://material.io/design/interaction/states.html#anatomy
                            ? colorScheme.primary.withOpacity(0.08)
                            : Colors.transparent,
                      ),
                      CardItemContent(destination: widget.destination),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.check_circle,
                            color: _isSelected
                                ? colorScheme.primary
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}

class CardItemContent extends StatelessWidget {
  const CardItemContent({Key key, @required this.destination})
      : assert(destination != null),
        super(key: key);

  final CardItems destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5.copyWith(color: Colors.white);
    final descriptionStyle = theme.textTheme.subtitle1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          width: 100,
          child: Stack(
            children: [
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as
                // part of the Material and display ink effects above it. Using
                // a standard Image will obscure the ink splash.
                child: Ink.image(
                  image: AssetImage(
                    destination.assetName,
                    package: destination.assetPackage,
                  ),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    destination.title,
                    style: titleStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Description and share/explore buttons.
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // This array contains the three line description on each card
                // demo.
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    destination.description,
                    style: descriptionStyle.copyWith(color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (destination.type == CardType.standard)
        // share, explore buttons
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                child: Text("Share",
                    semanticsLabel: destination.title),
                textColor: Colors.amber.shade500,
                onPressed: () {
                  print('pressed');
                },
              ),
              FlatButton(
                child: Text("Explore",
                    semanticsLabel: destination.title),
                textColor: Colors.amber.shade500,
                onPressed: () {
                  print('pressed');
                },
              ),
            ],
          ),
      ],
    );
  }
}

class ServicesCards extends StatefulWidget {
  const ServicesCards();

  @override
  _ServicesCardsState createState() => _ServicesCardsState();
}

class _ServicesCardsState extends State<ServicesCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("CardTitle"),
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            for (final destination in servicesCardList(context))
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: (destination.type == CardType.standard)
                    ? CardItem(destination: destination)
                    : destination.type == CardType.tappable
                    ? TappableCardItem(
                    destination: destination)
                    : SelectableCardItem(
                    destination: destination),
              ),
          ],
        ),
      ),
    );
  }
}

class CardLayout extends StatelessWidget {
  const CardLayout(this.title, this.subTitle, this.image);
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
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                style: TextStyle( color: Colors.black54, fontSize: 18.0)),
        ],
      ),
        )
    )
    );
  }
}

