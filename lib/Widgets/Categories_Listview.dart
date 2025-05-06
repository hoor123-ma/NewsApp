import 'package:flutter/material.dart';
import 'package:news_app/Models/CategoryModel.dart';
import 'package:news_app/components/Category_Card.dart';

class CategoriesListview extends StatelessWidget {
  const CategoriesListview({super.key});

  final List<CategoryModel> Cards = const [
    CategoryModel(image: 'assets/general.avif', name: "General"),
    CategoryModel(image: 'assets/health.avif', name: "Health"),
    CategoryModel(image: 'assets/sports.avif', name: "Sports"),
    CategoryModel(image: 'assets/science.avif', name: "Science"),
    CategoryModel(image: 'assets/entertaiment.avif', name: "Entertainment"),
    CategoryModel(image: 'assets/technology.jpeg', name: "Technology"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        // physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Cards.length,
        itemBuilder: (context, index) => CategoryCard(category: Cards[index]),
      ),
    );
  }
}
