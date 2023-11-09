import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/home/my_theme.dart';
import 'package:news/screens/home/tabs/news/article_details_screen.dart';
import '../model/ArticlesResponse.dart';
import 'package:url_launcher/url_launcher.dart';
class ArticleWidget extends StatelessWidget {
  Article article;
  ArticleWidget({required this.article});
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ArticleDetails.routeName,
      arguments: article),
      child: Padding(
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
          ],
        ),
      ),
    );
  }
}
