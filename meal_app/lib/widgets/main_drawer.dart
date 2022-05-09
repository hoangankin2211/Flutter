import 'package:flutter/material.dart';
import '../screens/filters-screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  final Map<String, String> listPage = const {
    'Meals': '/',
    'Filters': FiltersScreen.routeName
  };
  Widget buildListTitle(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, size: 20),
      onTap: () =>
          Navigator.of(context).pushReplacementNamed(listPage[title] as String),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
      ),
      hoverColor: Colors.white12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 10,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Text(
                'COOKING UP',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(
              child: buildListTitle(context, Icons.restaurant, 'Meals'),
            ),
            SizedBox(
              child: buildListTitle(context, Icons.filter, 'Filters'),
            )
          ],
        ),
      ),
    );
  }
}
