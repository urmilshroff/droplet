import 'package:droplet/utils/colors.dart';
import 'package:droplet/utils/text_styles.dart';
import 'package:droplet/utils/ui_helpers.dart';
import 'package:droplet/widgets/sexy_tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAboutPage extends StatefulWidget {
  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  List<String> itemContent = [
    'About',
    'Droplet encourages citizens to save water and makes them aware of the hidden problems that water shortages cause to our society.',
    'Credits',
    'This app was made by Urmil Shroff and Nirmit Agarwal',
  ]; //the text in the tile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: invertInvertColorsStrong(context),
      body: Container(
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
                    color: invertColorsStrong(context),
                    iconSize: 26.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      'About',
                      style: isThemeCurrentlyDark(context)
                          ? TitleStyles.white
                          : TitleStyles.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Hero(
                    tag: 'tile2',
                    child: SexyTile(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icon/icon-adaptive.png'),
                                ),
                              ),
                            ),
                            Text(
                              itemContent[0],
                              style: TitleStyles.accent,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              itemContent[1],
                              style: isThemeCurrentlyDark(context)
                                  ? BodyStyles.white
                                  : BodyStyles.black,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      splashColor: MyColors.accent,
                    ),
                  ),
                  SexyTile(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/credits/urmil.jpg'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Urmil Shroff',
                            style: isThemeCurrentlyDark(context)
                                ? HeadingStyles.white
                                : HeadingStyles.black,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  EvaIcons.person,
                                  color: invertColorsMild(context),
                                  size: 24.0,
                                ),
                                onPressed: () => doNothing(),
                              ),
                              IconButton(
                                icon: Icon(
                                  EvaIcons.twitter,
                                  color: MyColors.accent,
                                  size: 26.0,
                                ),
                                onPressed: () => doNothing(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    splashColor: MyColors.accent,
                  ),
                  SexyTile(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/credits/nirmit.jpg'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Nirmit Agrawal',
                            style: isThemeCurrentlyDark(context)
                                ? HeadingStyles.white
                                : HeadingStyles.black,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  EvaIcons.person,
                                  color: invertColorsMild(context),
                                  size: 24.0,
                                ),
                                onPressed: () => doNothing(),
                              ),
                              IconButton(
                                icon: Icon(
                                  EvaIcons.twitter,
                                  color: MyColors.accent,
                                  size: 26.0,
                                ),
                                onPressed: () => doNothing(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    splashColor: MyColors.accent,
                  ),
                  SizedBox(
                    height: 36.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        child: Icon(
          EvaIcons.github,
          size: 36.0,
        ),
        tooltip: 'View GitHub repo',
        foregroundColor: invertInvertColorsStrong(context),
        backgroundColor: invertColorsStrong(context),
        elevation: 5.0,
        onPressed: () => doNothing(),
      ),
    );
  }
}
