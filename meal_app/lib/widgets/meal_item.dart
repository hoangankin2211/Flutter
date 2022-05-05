import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_item_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({Key? key, required this.meal}) : super(key: key);

  String? get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String? get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealItemDetailScreen.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 220,
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 2),
                        Text(
                          '${meal.duration} min',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 2),
                        Text(
                          '$affordabilityText',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 2),
                        Text(
                          '$complexityText',
                        ),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
