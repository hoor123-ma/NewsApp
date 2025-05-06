import 'package:flutter/material.dart';
import 'package:news_app/Models/article_model.dart';
import 'package:news_app/Services/News_Service.dart';
import 'package:news_app/components/News_Card.dart';

class NewsListview extends StatefulWidget {
  NewsListview({super.key});

  @override
  State<NewsListview> createState() => _NewsListviewState();
}

class _NewsListviewState extends State<NewsListview> {
  List<ArticleModel> articles = [];
  @override
  @override
  void initState() {
    super.initState();
    getNews(); // دالة async خارجية
  }

  void getNews() async {
    articles =
        await NewsService(
          query:
              'https://newsapi.org/v2/everything?language=ar&apiKey=db3fc98df7e44e76a1e051f28f4c4386&q=مصر',
        ).getNews();
    setState(() {}); // علشان يعيد بناء الواجهة بعد تحميل البيانات
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return NewsCard(article: articles[index]);
      }, childCount: articles.length),
    );
  }
}
