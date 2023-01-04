import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../helper/data.dart';
import '../helper/news.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';
import 'article_view.dart';
import 'category_news.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }
  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
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
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) :SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          child: Column(
            children: <Widget>[

              ///Categories
          //Expanded(
          //child: SizedBox(
           Container(

            height: 100.0,

              //Container(
                child: ListView.builder(
                  itemCount: categories.length,
                    shrinkWrap:true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName,
                    );
                    }),
              ),

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
           ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  //const CategoryTile({Key? key}) : super(key: key);
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryNews(
            category: categoryName.toLowerCase(),
          )
        ));

      },
      child: Container(
        margin: EdgeInsets.only(right: 6),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl:imageUrl, width: 100, height: 100, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.bottomCenter,

              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black54,

              ),
              child: Text(categoryName, style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
              ),),
            ),
          ],
        ),
      ),
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



