import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatelessWidget {
  final String title;
  final String description;
  final String imageurls;

  ArticleView({
    required this.title,
    required this.description,
    required this.imageurls,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(imageurls),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          // Expanded(
          //   child: WebView(
          //     initialUrl: imageurls,
          //     javascriptMode: JavascriptMode.unrestricted,
          //   ),
          // ),
        ],
      ),
    );
  }
}
