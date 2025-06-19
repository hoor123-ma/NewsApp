import 'package:flutter/material.dart';
import 'package:news_app/Models/article_model.dart';
import 'package:news_app/Services/News_Service.dart';
import 'package:news_app/Widgets/news_list-view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, this.categoryName = 'مصر'});
  final String categoryName;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var articles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String translatedCategory;
    switch (widget.categoryName) {
      case 'General':
        translatedCategory = 'مصر';
        break;
      case 'Health':
        translatedCategory = 'الصحة';
        break;
      case 'Science':
        translatedCategory = 'العلوم';
        break;
      case 'Technology':
        translatedCategory = 'التكنولوجيا';
        break;
      case 'Entertainment':
        translatedCategory = 'الترفيه';
        break;
      case 'Sports':
        translatedCategory = 'الرياضة';
      default:
        translatedCategory = 'مصر';
    }

    articles =
        NewsService(
          query:
              "https://newsapi.org/v2/everything?language=ar&apiKey=db3fc98df7e44e76a1e051f28f4c4386&q=$translatedCategory",
        ).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(child: Indicator());
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: ErrorMessage(message: snapshot.error.toString()),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(child: Text('No articles found')),
          );
        }
        return NewsListview(articles: snapshot.data!);
      },
    );
  }
}

// ErrorMessage widget to display error messages
class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) => Text('Error: $message');
}

// Indicator widget to show a loading indicator
class Indicator extends StatelessWidget {
  const Indicator({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
