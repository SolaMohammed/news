import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryColor=Color(0xff39A552);
  static Color pinkColor=Color(0xffED1E79);
  static Color redColor=Color(0xffC91C22);
  static Color blueColor=Color(0xff003E90);
  static Color orangeColor=Color(0xffCF7E48);
  static Color yellowColor=Color(0xffF2D352);
  static Color babyBlueColor=Color(0xff4882CF);
  static Color grayColor=Color(0xff707070);
  static Color darkGrayColor=Color(0xff42505C);
static ThemeData light=ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white
  ),
  primaryColor: primaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle:TextStyle(color: Colors.white,fontSize: 22) ,
    centerTitle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
      bottomLeft:Radius.circular(30) ,bottomRight:Radius.circular(30)
    )),
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(
      color: grayColor,fontSize:13,
    ),
    bodyMedium:TextStyle(
      color: darkGrayColor,fontSize:14,
    ),
    bodyLarge: TextStyle(
       color: Colors.white,fontSize: 22,
      ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
  )
);
}