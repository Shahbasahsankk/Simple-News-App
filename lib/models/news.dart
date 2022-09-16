class TopHeadlinesModel {
  final List<Article> articleList;

  TopHeadlinesModel({required this.articleList});
  factory TopHeadlinesModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> article=json['ariticles'];
    return TopHeadlinesModel(
      articleList: article
          .map(
            (e) => Article.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class Article {
  final String author;
  final String description;
  final String title;
  final String imageUrl;
  Article({
    required this.author,
    required this.description,
    required this.title,
    required this.imageUrl,
  });
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        author: json['author'] ?? 'No Name',
        description: json['description'] ?? 'No Description',
        title: json['title'] ?? 'No Title',
        imageUrl: json['urlToImage'] ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2SBpAupCYMudA06lLrklIKAe52BgPnMyiGk5NzhA&s');
  }
}
