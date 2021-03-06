import 'package:droplet/utils/colors.dart';
import 'package:droplet/utils/page_transformer.dart';
import 'package:droplet/utils/text_styles.dart';
import 'package:droplet/utils/ui_helpers.dart';
import 'package:droplet/widgets/parallax_cards.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParallaxCardItem {
  ParallaxCardItem({
    this.title,
    this.body,
    this.imagePath,
  });

  final String title;
  final String body;
  final String imagePath;
}

final parallaxCardItemsList = <ParallaxCardItem>[
  ParallaxCardItem(
    title: 'Did you know that water sports like surfing, sailing and '
        'snorkeling disturb marine life?',
    body: 'Water Sports',
    imagePath: 'assets/cards/facts/1.jpg',
  ),
  ParallaxCardItem(
    title: 'Every year, 14B pounds of trash is dumped into the oceans. '
        'Imagine someone throwing all that in your house!',
    body: 'Don\'t Pollute!',
    imagePath: 'assets/cards/facts/2.jpg',
  ),
  ParallaxCardItem(
    title: 'These accidents are the worst - pollute the water and kill '
        'thousands of '
        'creatures living in the oceans.',
    body: 'Oil Spills',
    imagePath: 'assets/cards/facts/3.jpg',
  ),
  ParallaxCardItem(
    title: 'Oceans reflect the blue skies. Imagine if it was the other way '
        'around - we would see reflections of garbage in the skies!',
    body: 'Blue Oceans',
    imagePath: 'assets/cards/facts/4.jpg',
  ),
  ParallaxCardItem(
    title: 'The oceans are a part of Earth, which is our home. Would you like'
        ' to pollute your own home? Don\'t pollute oceans!',
    body: 'Oceans = Home',
    imagePath: 'assets/cards/facts/5.jpg',
  ),
];

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
var gradientStartColor;
var gradientEndColor;

class MyFactsPage extends StatefulWidget {
  @override
  _MyFactsPageState createState() => _MyFactsPageState();
}

class _MyFactsPageState extends State<MyFactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              //gradient colors change according to set theme
              colors: isThemeCurrentlyDark(context)
                  ? [GradientColors.darkStart, GradientColors.darkEnd]
                  : [GradientColors.lightStart, GradientColors.lightEnd],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 50.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(EvaIcons.arrowIosBack),
                    tooltip: 'Go back',
                    color: MyColors.light,
                    iconSize: 26.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Facts',
                    style: TitleStyles.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: SizedBox.fromSize(
                size: Size.fromHeight(550.0),
                child: PageTransformer(
                  pageViewBuilder: (context, visibilityResolver) {
                    return PageView.builder(
                      controller: PageController(viewportFraction: 0.85),
                      itemCount: parallaxCardItemsList.length,
                      itemBuilder: (context, index) {
                        final item = parallaxCardItemsList[index];
                        final pageVisibility =
                            visibilityResolver.resolvePageVisibility(index);

                        return ParallaxCards(
                          item: item,
                          pageVisibility: pageVisibility,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
