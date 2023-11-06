import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/ArticlesResponse.dart';
import 'package:news/screens/home/my_theme.dart';

class ArticleDetails extends StatelessWidget {
  static const routeName = 'news_details_screen';
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
    var article=ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
        ),
      shape: theme.appBarTheme.shape,
      centerTitle: true,
      title: Text(article.source?.name??""),
      backgroundColor: theme.primaryColor,
      titleTextStyle: theme.textTheme.titleLarge,
    ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage!,
                errorWidget: (_,__,___) => Icon(Icons.error),
                placeholder: (_, __) => Center(child: CircularProgressIndicator()) ,
                height: MediaQuery.of(context).size.height*.3,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 4,),
            Text(article.source?.name??"",style:theme.textTheme.bodySmall),
            SizedBox(height: 8,),
            Text(article.title??"",style:theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 10,),
            Text(article.publishedAt??"",style:theme.textTheme.bodySmall,textAlign:
            TextAlign.end
            ),
            SizedBox(height: 10,),
            Text(article.content??"",style:theme.textTheme.bodySmall),
            SizedBox(height: 10,),
            InkWell(
              onTap: () {

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("View Full Article",
                  style:theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 4,),
                  Icon(Icons.arrow_forward_ios,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

