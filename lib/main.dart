import 'package:droplet/pages/intro_page.dart';
import 'package:droplet/utils/colors.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) => ThemeData(
        fontFamily: 'Sen',
        primaryColor: MyColors.primary,
        accentColor: MyColors.accent,
        brightness: brightness, // default is dark
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Droplet',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: MyIntroPage(),
        );
      },
    );
  }
}