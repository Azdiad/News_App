class ArticleModel {
  String? urlToImage;
  String? title;
  String? description;
  String? url;

  ArticleModel({
    this.urlToImage,
    this.title,
    this.description,
    this.url,
    required author,
    required content,
  });
}
