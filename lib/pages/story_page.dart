import 'package:droplet/utils/colors.dart';
import 'package:droplet/utils/text_styles.dart';
import 'package:droplet/utils/ui_helpers.dart';
import 'package:droplet/widgets/swiping_cards.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

List<String> swipingCardImages = [
  'assets/cards/story/4.jpg',
  'assets/cards/story/3.jpg',
  'assets/cards/story/2.jpg',
  'assets/cards/story/1.jpg',
];

List<String> swipingCardTitles = [
  '...got filled with garbage😢',
  'After her beautiful home...',
  '...that\'s how Goldy feels',
  'Imagine living alone...',
];

PageController controller =
    PageController(initialPage: swipingCardImages.length - 1);
var i = swipingCardImages.length - 1;

class MyStoryPage extends StatefulWidget {
  @override
  _MyFactsPageState createState() => _MyFactsPageState();
}

class _MyFactsPageState extends State<MyStoryPage> {
  var currentPage = swipingCardImages.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: swipingCardImages.length - 1);
    controller.addListener(
      () {
        setState(
          () {
            currentPage = controller.page;
          },
        );
      },
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
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
                bottom: 30.0,
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
                    'Story',
                    style: TitleStyles.white,
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                SwipingCards(currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: swipingCardImages.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
