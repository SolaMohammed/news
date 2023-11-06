import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/screens/home/my_theme.dart';
import 'package:news/screens/home/tabs/news/news_list/news_list.dart';
import 'package:news/model/SourcesReponse.dart';

class NewsTab extends StatefulWidget {
  String categoryId;
  NewsTab({required this.categoryId});
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex=0;
  bool isSelected=true;

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.categoryId),
      builder:(context, snapshot) {
        if(snapshot.hasData)
          return buildTabs(snapshot.data!);
        else if(snapshot.hasError)
          return Text(snapshot.error.toString());
        else
          return Center(child: CircularProgressIndicator(
            color: MyTheme.primaryColor,
          ));
      },
    );
  }

  Widget buildTabs(List<Source> data) {
    return DefaultTabController(
      length: data.length,
      child: Column(
        children: [
          SizedBox(height: 8,),
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (value) {
              currentTabIndex=value;
              setState(() {

              });},
            tabs:
               data.map((source) {
                 isSelected = (currentTabIndex == data.indexOf(source));
                 return Container(
                     padding: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       color: isSelected ? MyTheme.primaryColor : Colors.white,
                       border: Border.all(color: MyTheme.primaryColor),
                       borderRadius: BorderRadius.circular(22),
                     ),
                     child: Text(source.name ?? "", style: TextStyle(
                         color: isSelected ? Colors.white : MyTheme.primaryColor
                     ),));
               }).toList(),
          ),
          Expanded(
            child: TabBarView(
                children:data.map((source) {
                  return NewsList(sourceId: source.id!);
                }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
