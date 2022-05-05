import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/categories_meal_screen.dart';
import './screens/meal_item_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meal App',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.orange[300],
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 30,
              fontWeight: FontWeight.normal,
            ),
            headline2: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            headline3: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // home: const CategoriesScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => const TabsScreen(),
          CategoriesMealScreen.routeName: (context) =>
              const CategoriesMealScreen(),
          MealItemDetailScreen.routeName: (context) =>
              const MealItemDetailScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (context) => const CategoriesScreen());
        });
  }
}
