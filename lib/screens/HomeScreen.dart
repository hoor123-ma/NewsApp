import 'package:flutter/material.dart';
import 'package:news_app/Widgets/Categories_Listview.dart';
import 'package:news_app/Widgets/News_Listview.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

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
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: const CategoriesListview()),
          NewsListview(),
        ],
      ),
      //Column(children: [CategoriesListview(), NewsListview()]),
    );
  }
}
