import 'package:flutter/material.dart';
import 'package:news/screens/home/my_theme.dart';
import 'package:news/screens/home/tabs/categories/category_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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



 // loadData(BuildContext context){
 //   for(int i=0;i<categories.length;i++){
 //     categories[i].text=AppLocalizations.of(context)!.;
 //   }
 // }

}