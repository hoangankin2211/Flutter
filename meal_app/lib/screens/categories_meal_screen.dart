import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/category.dart';
import '../dummy_data.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeName = '/categories-meal-screen';

  const CategoriesMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Category;
    final Category category = routeArgument;
    final categoryMeals = dummyMeal.where(
      (element) {
        return element.categories.contains(category.id);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          category.title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(meal: categoryMeals[index]);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
