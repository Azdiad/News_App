import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/key/apiKey.dart';
import 'package:newsapp/model/articleModel.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apikey";

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        if (jsonData['status'] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element['title'] != null &&
                element['author'] != null &&
                element['description'] != null &&
                element['url'] != null &&
                element['urlToImage'] != null &&
                element['content'] != null) {
              ArticleModel articleModel = ArticleModel(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                url: element['url'],
                urlToImage: element['urlToImage'],
                // publishedAt: element['publishedAt'],
                content: element['content'],
              );
              news.add(articleModel);
            }
          });
        }
      } else {
        throw Exception("Failed to fetch news: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }
}

class CategoryNewsclass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=$apikey";

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        if (jsonData['status'] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element['title'] != null &&
                element['author'] != null &&
                element['description'] != null &&
                element['url'] != null &&
                element['urlToImage'] != null &&
                element['content'] != null) {
              ArticleModel articleModel = ArticleModel(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                url: element['url'],
                urlToImage: element['urlToImage'],
                // publishedAt: element['publishedAt'],
                content: element['content'],
              );
              news.add(articleModel);
            }
          });
        }
      } else {
        throw Exception("Failed to fetch news: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }
}
