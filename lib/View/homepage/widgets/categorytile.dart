import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/View/category/categorynews.dart';

class categoryTile extends StatelessWidget {
  final String imageurl, categoryname;

  const categoryTile(
      {super.key, required this.imageurl, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CategoryNews(category: categoryname.toLowerCase()),
            ));
      },
      child: Container(
        width: 140,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imageurl,
                width: 170,
                height: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                alignment: Alignment.center,
                width: 110,
                height: 80,
                color: Colors.black26,
                child: Text(
                  categoryname,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
