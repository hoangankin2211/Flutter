import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItemDetailScreen extends StatelessWidget {
  const MealItemDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meal routeArgs = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(routeArgs.title,
              style: Theme.of(context).textTheme.headline2),
        ),
        body: const Center(
          child: Text('Test'),
        ));
  }
}
