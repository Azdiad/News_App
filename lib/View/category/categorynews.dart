import 'package:flutter/material.dart';
import 'package:newsapp/View/homepage/widgets/blogTile.dart';
import 'package:newsapp/View/textstyle/textstyles.dart';
import 'package:newsapp/helper/news.dart';

import 'package:newsapp/model/articleModel.dart';

class CategoryNews extends StatefulWidget {
  CategoryNews({super.key, required this.category});
  final String category;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  Future<void> getCategoryNews() async {
    CategoryNewsclass newsClass = CategoryNewsclass();
    await newsClass.getNews(widget.category);
    setState(() {
      articles = newsClass.news;
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              ' News',
              style: tstyle,
            ),
          ],
        ),
      ),
      //Blog
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            child: ListView.builder(
              itemCount: articles.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return BlogTile(
                  imgUrl: articles[index].urlToImage!,
                  title: articles[index].title!,
                  description: articles[index].description!,
                  url: articles[index].url!,
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
