import 'package:dio/dio.dart';
import 'package:news_app/Models/article_model.dart';

class NewsService {
  final Dio dio = Dio();
  final String query;
  NewsService({required this.query});

  Future<List<ArticleModel>> getNews() async {
    try {
      Response response = await dio.get(query);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      //this equal => List<Map<String, dynamic>> articles=jsonData['articles'] as List<Map<String,dynamic>>;

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      throw Exception();
    }
  }
}
