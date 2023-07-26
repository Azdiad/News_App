import 'package:flutter/material.dart';
import 'package:newsapp/View/homepage/widgets/blogTile.dart';
import 'package:newsapp/View/homepage/widgets/categorytile.dart';
import 'package:newsapp/View/textstyle/textstyles.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/model/articleModel.dart';
import 'package:newsapp/model/categoryModel.dart';

class homes extends StatefulWidget {
  const homes({super.key});

  @override
  State<homes> createState() => _homesState();
}

class _homesState extends State<homes> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getcategories();
    getNews();
  }

  Future<void> getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    setState(() {
      articles = newsClass.news;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Latest',
              style: tstyle,
            ),
            Text(
              ' News',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
        ),
        backgroundColor: Colors.cyanAccent[200],
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return categoryTile(
                        imageurl: categories[index].imageurl,
                        categoryname: categories[index].categoryname,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
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
              ],
            ),
    );
  }
}
