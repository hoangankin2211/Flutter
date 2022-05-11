import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _removeItemFavorite(String id) {
    setState(() {
      widget.favoriteMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.isEmpty
        ? Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.center,
            child: Text(
              'You don\'t have any favorite meal yet !',
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        : Center(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Stack(children: [
                  MealItem(
                    meal: widget.favoriteMeals[index],
                    removeItem: _removeItemFavorite,
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: IconButton(
                        onPressed: () =>
                            _removeItemFavorite(widget.favoriteMeals[index].id),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      )),
                ]);
              },
              itemCount: widget.favoriteMeals.length,
            ),
          );
  }
}
