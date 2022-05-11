import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/ingredients_item.dart';
import '../widgets/step_item.dart';

class MealItemDetailScreen extends StatefulWidget {
  static const routeName = '/meal_detail_screen';
  final Function(String) markFavorite;
  final bool Function(Meal) isExisting;
  const MealItemDetailScreen(
      {Key? key, required this.isExisting, required this.markFavorite})
      : super(key: key);

  @override
  State<MealItemDetailScreen> createState() => _MealItemDetailScreenState();
}

class _MealItemDetailScreenState extends State<MealItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Meal routeArgs = ModalRoute.of(context)?.settings.arguments as Meal;
    Color mark = widget.isExisting(routeArgs) ? Colors.red : Colors.white;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        title:
            Text(routeArgs.title, style: Theme.of(context).textTheme.headline2),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  routeArgs.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                const Text(
                  'Ingredient',
                  style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return IngredientItem(
                          ingredient: routeArgs.ingredients[index]);
                    },
                    itemCount: routeArgs.ingredients.length,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  const Text(
                    'Steps',
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return StepItem(
                          step: routeArgs.steps[index],
                          index: index,
                        );
                      },
                      itemCount: routeArgs.steps.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomRight,
        width: 112,
        height: 50,
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () => widget.markFavorite(routeArgs.id),
              heroTag: "btn1",
              child: Icon(
                Icons.favorite,
                color: mark,
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            FloatingActionButton(
              onPressed: () => Navigator.of(context).pop(routeArgs.id),
              heroTag: "btn2",
              child: const Icon(Icons.delete),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
