import 'dart:async';
//import 'package:newsy_app/news.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  //const ArticleView({Key? key, required this.blogUrl, required String imageUrl}) : super(key: key);
  final String postUrl;
  ArticleView({  required this.postUrl, required String imageUrl, required String blogUrl });
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late String finalUrl;
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  void initState() {
    if(widget.postUrl.contains("http://")){
      finalUrl = widget.postUrl.replaceAll("http://","https://");
    }else{
      finalUrl =widget.postUrl;
    }
    // TODO: implement initState
    super.initState();
  }

  //final Completer<WebViewController> _completer = Completer<WebViewController>();
  //final Completer<WebViewController> _controller =
  //Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("NEWSY"),
            Text("News", style: TextStyle(
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
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: WebView(
            initialUrl: finalUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);

            }),
      ),
    );

  }
}
