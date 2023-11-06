import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/ArticlesResponse.dart';

import '../../../../../widgets/article_widget.dart';

class NewsList extends StatelessWidget {
  final String sourceId;
  const NewsList({required this.sourceId});
  Widget build(BuildContext context) {
    return
      FutureBuilder(
          future: ApiManager.getArticles(sourceId),
          builder:(context, snapshot){
            if(snapshot.hasData) return buildArticlesListView(snapshot.data!);
            else if(snapshot.hasError) return Text(snapshot.error.toString());
            else return Center(child: CircularProgressIndicator());
          },
      )
    ;
  }
}

 Widget buildArticlesListView (List<Article> data){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ArticleWidget(article:data[index]);
      },
    ),
  );
}
