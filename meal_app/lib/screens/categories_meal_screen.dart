import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/category.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/add_meal_catalog.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = '/categories-meal-screen';
  final Map<String, bool> filters;
  const CategoriesMealScreen({Key? key, required this.filters})
      : super(key: key);

  @override
  State<CategoriesMealScreen> createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  late final Category category;
  late final List<Meal> meals;
  bool _isLoadedList = false;

  void _removeItem(String id) {
    setState(() {
      meals.removeWhere((element) => element.id == id);
    });
  }

  void _addMealCatalog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const AddMealCatalog();
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isLoadedList) {
      category = ModalRoute.of(context)?.settings.arguments as Category;
      meals = dummyMeal.where((element) {
        if (element.isGlutenFree && widget.filters['gluten'] as bool) {
          return false;
        }
        if (element.isLactoseFree && widget.filters['lactose'] as bool) {
          return false;
        }
        if (element.isVegan && widget.filters['vegan'] as bool) {
          return false;
        }
        if (element.isVegetarian && widget.filters['vegetarian'] as bool) {
          return false;
        }
        return element.categories.contains(category.id);
      }).toList();
      _isLoadedList = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          category.title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Center(
        child: meals.isEmpty
            ? Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                    'There aren\'t any meal yey !!!\nAdd meal please !!!',
                    style: Theme.of(context).textTheme.headline2),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealItem(
                    meal: meals[index],
                    removeItem: _removeItem,
                  );
                },
                itemCount: meals.length,
              ),
      ),
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () => _addMealCatalog(context),
          child: const Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
          splashColor: Colors.orange,
        ),
      ),
    );
  }
}
