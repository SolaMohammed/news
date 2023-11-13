import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/ArticlesResponse.dart';
import 'package:news/model/SourcesReponse.dart';
import 'package:news/model/categoryDM.dart';
abstract class ApiManager{
  static const String baseUrl="newsapi.org";
  static const String apiKey="acf34873b69544eeaf1d503b6da57a9b";
  static const String sourcesEndPoint="/v2/top-headlines/sources";
  static const String ArticlesEndPoint="/v2/everything";
  static Future<List<Source>> getSources(String categoryId)async{
    Uri url=Uri.parse('https://$baseUrl$sourcesEndPoint?apiKey=$apiKey');  //request
   http.Response response=await http.get(url);  //get response
   Map json=jsonDecode(response.body); //convert string (response.body) to json map
   SourcesReponse sourcesReponse=SourcesReponse.fromJson(json);//convert json response map to object
   //response->string, json->map, sourcesReponse->object
    if(  //check if data (response) is arrived or not
      response.statusCode>=200&&response.statusCode<300
      &&sourcesReponse.sources?.isNotEmpty==true){
      return sourcesReponse.sources!;
    }
    throw Exception(sourcesReponse.message);
  }
  static Future<List<Article>> getArticles({ required String sourceId})async{
    Uri url=Uri.https(baseUrl,ArticlesEndPoint,{
      "apiKey":apiKey,
      "sources":sourceId,
    });
    http.Response response=await http.get(url);
    Map json=jsonDecode(response.body);
    ArticlesResponse articlesResponse=ArticlesResponse.fromJson(json);
    if(response.statusCode>=200&&response.statusCode<300&&
    articlesResponse.articles?.isNotEmpty==true
    ) return articlesResponse.articles!;
    throw Exception(articlesResponse.message);
  }

  static Future<List<Article>> getResults(String query)async{
    Uri url=Uri.https(baseUrl,ArticlesEndPoint,{
      "apiKey":apiKey,
      "q":query
    });
    http.Response response=await http.get(url);
    Map json=jsonDecode(response.body);
    ArticlesResponse articlesResponse=ArticlesResponse.fromJson(json);
    if(response.statusCode>=200&&response.statusCode<300&&
        articlesResponse.articles?.isNotEmpty==true
    ) return articlesResponse.articles!;
    throw Exception(articlesResponse.message);
  }
}