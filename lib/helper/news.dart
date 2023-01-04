
import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news = [];

  Future<void> getNews() async{
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=8b5ab23b803a4a388df81b2f54daf64b");

    //var response = await http.get(Uri.parse(url));
    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    //var urlImage = Uri.parse("

    if(jsonData['status']== "ok"){
      jsonData["articles"].forEach((element){

        if( element['description'] != null){

          ArticleModel articleModel = ArticleModel(//"title","author","description",url,"content"
            title: element['title'],
            author: element["author"],
             description: element["description"],
             url: element["url"],
            urlToImage: element["urlToImage"],

            content:element["content"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass{

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=8b5ab23b803a4a388df81b2f54daf64b");

    //var response = await http.get(Uri.parse(url));
    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    //var urlImage = Uri.parse("

    if(jsonData['status']== "ok"){
      jsonData["articles"].forEach((element){

        if( element['description'] != null){

          ArticleModel articleModel = ArticleModel(//"title","author","description",url,"content"
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],

              content:element["content"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}

