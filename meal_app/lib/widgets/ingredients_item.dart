import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String ingredient;
  const IngredientItem({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          const Expanded(child: Icon(Icons.food_bank)),
          Expanded(
            flex: 3,
            child: Text(
              ingredient,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
