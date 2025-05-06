import 'package:flutter/material.dart';
import 'package:news_app/Models/CategoryModel.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 30),
      alignment: Alignment.center,

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(category.image),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 150,
      width: 200,
      child: Text(
        category.name,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Roboto",
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
