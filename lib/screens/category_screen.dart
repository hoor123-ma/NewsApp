import 'package:flutter/material.dart';
import 'package:news_app/Widgets/news-list-view-builder.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  const CategoryScreen({super.key, required this.categoryName});

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
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [NewsListViewBuilder(categoryName: categoryName)],
      ),
    );
  }
}
