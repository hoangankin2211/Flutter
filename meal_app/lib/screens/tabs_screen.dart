import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _page = [];

  List<Meal> favorites = [];

  int selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _page = [
      {
        'title': 'Categories',
        'widget': const CategoriesScreen(),
        'icon': const Icon(Icons.category),
      },
      {
        'title': 'Favorites',
        'widget': FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        'icon': const Icon(Icons.star),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('MealApp'),
      ),
      drawer: const MainDrawer(),
      body: _page[selectedIndex]['widget'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _selectPage,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        items: [
          ..._page.map((page) {
            return BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(225, 255, 183, 77),
              icon: page['icon'] as Icon,
              label: page['title'] as String,
            );
          }).toList()
        ],
      ),
    );
  }
}
