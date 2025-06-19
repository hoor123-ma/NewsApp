import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsScreen extends StatelessWidget {
  final ArticleModel article;
  const NewsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          children: const [
            Text("News", style: TextStyle(color: Colors.black)),
            Text("Cloud", style: TextStyle(color: Colors.orangeAccent)),
            //Padding(padding: EdgeInsets.only(bottom: 7)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: article.image,
                  width: 400,
                  height: 220,
                  fit: BoxFit.fill,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget:
                      (context, url, error) => const Center(
                        child: Icon(Icons.error, color: Colors.red, size: 50),
                      ),
                ),
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
                textDirection: TextDirection.rtl,
              ),

              const SizedBox(height: 8),
              Text(
                article.description,
                style: TextStyle(color: const Color(0xFF333333), fontSize: 17),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
