import 'package:flutter/material.dart';

import '../helper/news.dart';
import '../models/article_model.dart';
import 'article_view.dart';
import 'home.dart';

class CategoryNews extends StatefulWidget {
  //const CategoryNews({Key? key}) : super(key: key);

  final String category;
  CategoryNews({required this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("NEWSY"),
            Text("News",style: TextStyle(
                color: Colors.blue
            ),)
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body:_loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: <Widget>[
              ///Blogs
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage.toString(),
                        title: articles[index].title.toString(),
                        desc: articles[index].description.toString(),
                        url: articles[index].url.toString(),

                      );
                    }),
              )
            ]
          )
        ),
      )
    );
  }
}

class BlogTile extends StatelessWidget {
  const BlogTile({Key? key, required this.imageUrl, required this.title, required this.desc,required this.url}) : super(key: key);
  final String imageUrl, title, desc, url;
  //BlogTile({required this.imageUrl,required this.title,required this.desc,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              imageUrl: url, blogUrl: '', postUrl: '',
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            Text(title,style: TextStyle(
                fontSize: 17,
                color:Colors.black87,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(
                color:Colors.grey
            ))
          ],
        ),
      ),
    );
  }
}
