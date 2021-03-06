import 'package:droplet/pages/about_page.dart';
import 'package:droplet/pages/facts_page.dart';
import 'package:droplet/pages/story_page.dart';
import 'package:droplet/utils/colors.dart';
import 'package:droplet/utils/text_styles.dart';
import 'package:droplet/utils/ui_helpers.dart';
import 'package:droplet/widgets/sexy_tile.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//this page is based on https://github.com/Ivaskuu/dashboard

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> itemNames = [
      'Facts',
      'Story',
      'About',
    ]; //name of each individual tile

    return Scaffold(
      backgroundColor: invertInvertColorsStrong(context),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 40.0,
                top: 60.0,
                bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Droplet',
                    style: isThemeCurrentlyDark(context)
                        ? TitleStyles.white
                        : TitleStyles.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 2.6,
                children: List.generate(
                  itemNames.length,
                  (index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Hero(
                          tag: 'tile$index',
                          child: SexyTile(),
                        ),
                        Container(
                          margin: EdgeInsets.all(15.0),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Hero(
                                    tag: 'title$index',
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        '${itemNames[index]}',
                                        style: isThemeCurrentlyDark(context)
                                            ? HeadingStyles.white
                                            : HeadingStyles.black,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              splashColor: MyColors.accent,
                              borderRadius: BorderRadius.circular(15.0),
                              onTap: () {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) {
                                        return MyFactsPage();
                                      },
                                    ),
                                  );
                                } else if (index == 1) {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) {
                                        return MyStoryPage();
                                      },
                                    ),
                                  );
                                } else if (index == 2) {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) {
                                        return MyAboutPage();
                                      },
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        child: isThemeCurrentlyDark(context)
            ? Icon(
                EvaIcons.sun,
                size: 30.0,
              ) //show sun icon when in dark mode
            : Icon(
                EvaIcons.moon,
                size: 26.0,
              ), //show moon icon when in light mode
        tooltip: isThemeCurrentlyDark(context)
            ? 'Switch to light mode'
            : 'Switch to dark mode',
        foregroundColor: invertInvertColorsStrong(context),
        backgroundColor: invertInvertColorsTheme(context),
        elevation: 5.0,
        onPressed: () {
          DynamicTheme.of(context).setBrightness(
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark);
        },
      ),
    );
  }
}
