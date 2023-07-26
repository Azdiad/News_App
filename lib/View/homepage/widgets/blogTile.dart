import 'package:flutter/material.dart';
import 'package:newsapp/View/homepage/widgets/blogtitledetail.dart';

class BlogTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;
  final String url;

  BlogTile({
    required this.imgUrl,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogDetailsPage(
                  imgUrl: imgUrl, title: title, description: description),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imgUrl),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
