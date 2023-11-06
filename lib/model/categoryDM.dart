import 'package:flutter/material.dart';
import 'package:news/screens/home/my_theme.dart';
import 'package:news/screens/home/tabs/categories/category_widget.dart';

class CategoryDM{
  String id;
  String text;
  String imagePath;
  Color backgroundColor;
  bool isLeftSided;
  CategoryDM({
    required this.id, required this.text,required this.imagePath,
    required this.backgroundColor,required this.isLeftSided
});

 static List<CategoryDM> categories=[
   CategoryDM(id: 'sports', text: 'Sports', imagePath: 'assets/sports.png',
       backgroundColor:MyTheme.redColor , isLeftSided: true),
   CategoryDM(id: 'technology', text: 'Politics', imagePath: 'assets/Politics.png',
       backgroundColor:MyTheme.blueColor , isLeftSided: false),
   CategoryDM(id: 'health', text: 'Health', imagePath: 'assets/health.png',
       backgroundColor:MyTheme.pinkColor , isLeftSided: true),
   CategoryDM(id: 'bussiness', text: 'Bussiness', imagePath: 'assets/bussines.png',
       backgroundColor:MyTheme.orangeColor , isLeftSided: false),
   CategoryDM(id: 'entertainment', text: 'Environment', imagePath: 'assets/environment.png',
       backgroundColor:MyTheme.babyBlueColor , isLeftSided: true),
   CategoryDM(id: 'sience', text: 'Sience', imagePath: 'assets/science.png',
       backgroundColor:MyTheme.yellowColor , isLeftSided: false),
 ];

}