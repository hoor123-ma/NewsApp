import 'package:flutter/material.dart';
import 'package:news_app/Models/article_model.dart';
import 'package:news_app/screens/NewsScreen.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                article.image,
                width: 400,
                height: 220,
                fit: BoxFit.fill,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsScreen(article: article),
                ),
              );
            },
          ),

          const SizedBox(height: 12),
          Text(
            article.title,
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 8),
          Text(
            article.description,
            style: TextStyle(color: const Color(0xFF333333), fontSize: 17),
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
