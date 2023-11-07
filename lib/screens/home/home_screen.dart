import 'package:flutter/material.dart';
import 'package:news/model/categoryDM.dart';
import 'package:news/screens/home/my_theme.dart';
import 'package:news/screens/home/tabs/categories/categories_tab.dart';
import 'package:news/screens/home/tabs/news/news_search.dart';
import 'package:news/screens/home/tabs/news/news_tab.dart';
import 'package:news/screens/home/tabs/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routName="home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;
  CategoryDM? selectedCategory;
  @override
  void initState() {
  currentTab=CategoriesTab(onCategoryClick);
  }
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async{
        if(currentTab is! CategoriesTab){
          currentTab=CategoriesTab(onCategoryClick);
          setState(() {
          });
              return false;
        }else{
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              showSearch(context: context, delegate: NewsSearch());
            }, icon: Icon(Icons.search,size: 30,))
          ],
          shape: theme.appBarTheme.shape,
         centerTitle: true,
         title: selectedCategory==null? Text("News App"):Text(selectedCategory!.text),
         backgroundColor: theme.primaryColor,
         titleTextStyle: theme.textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
        body: currentTab,
        drawer:  buildDrawer(),
      ),
    );
  }

  Widget buildDrawer(){
   return Drawer(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Container(
           color: MyTheme.primaryColor,
           height: MediaQuery.of(context).size.height*0.2,
           child: Center(child: Text("News App!",style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white))),
         ),
         SizedBox(height: 8,),
         InkWell(
           onTap: () {
             setState(() {
             });
             currentTab=CategoriesTab(onCategoryClick);
             Navigator.pop(context);
           },
             child: buildDrawerRow(Icons.menu, "Categories")
         ),
         SizedBox(height: 8,),
         InkWell(
             onTap: () {
               currentTab=SettingsTab();
               Navigator.pop(context);
               setState(() {
               });
             },
             child: buildDrawerRow(Icons.settings, "Settings")
         ),
       ],
     ),
   );
  }

  onCategoryClick(CategoryDM category){
    selectedCategory=category;
    currentTab=NewsTab(categoryId: category.id,);
    setState(() {
    });
  }

  Widget buildDrawerRow(IconData iconData,String text) {
    return Row(
     children: [
       SizedBox(width: 8,),
       Icon(iconData,color: Colors.black,size: 32,),
       SizedBox(width: 8,),
       Text(text,style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black)
       )
     ],
      
    );
  }
}
