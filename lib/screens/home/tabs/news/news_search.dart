import 'package:flutter/material.dart';
import 'package:news/screens/home/my_theme.dart';

import '../../../../api/api_manager.dart';
import '../../../../model/ArticlesResponse.dart';
import '../../../../widgets/article_widget.dart';
import 'news_list/news_list.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon:Icon(Icons.search),iconSize: 25,
      onPressed: () => showResults(context),),
      SizedBox(width: 8,)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon:Icon(Icons.close),onPressed: () {
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
   if(query.isEmpty) return Text("");
   return FutureBuilder(
      future: ApiManager.getResults(query),
      builder:(context, snapshot){
        if(snapshot.hasData) return buildArticlesListView(snapshot.data!);
        else if(snapshot.hasError) return Text(snapshot.error.toString());
        else return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return MyTheme.light;
  }

}