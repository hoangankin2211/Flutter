import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesItem extends StatelessWidget {
  static const routeName = '/categories-meal-screen';

  final Category category;
  const CategoriesItem({Key? key, required this.category}) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      routeName,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(25),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
