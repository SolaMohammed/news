import 'package:flutter/material.dart';
import 'package:news/screens/home/home_screen.dart';
import 'package:news/screens/home/my_theme.dart';
import 'package:news/screens/home/tabs/news/article_details_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName :(context) => HomeScreen(),
        ArticleDetails.routeName:(context)=>ArticleDetails()
      },
      initialRoute: HomeScreen.routName,
      theme: MyTheme.light,
    );
  }

}
