import 'package:flutter/material.dart';
import 'package:news_app/Models/article_model.dart';
import 'package:news_app/components/News_Card.dart';

class NewsListview extends StatelessWidget {
  List<ArticleModel> articles = [];
  NewsListview({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return NewsCard(article: articles[index]);
      }, childCount: articles.length),
    );
  }
}
