import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import './product_overview_screen.dart';
import './orders_screen.dart';
import './user_products_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          AppBar(title: const Text('MENU')),
          ListTile(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ProductOverviewScreen.routeName),
            title: const Align(
                alignment: Alignment.topLeft, child: Icon(Icons.shop)),
            trailing: const Text('SHOP',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(OrderScreen.routeName),
            title: const Align(
                alignment: Alignment.topLeft, child: Icon(Icons.payment)),
            trailing: const Text('ORDER',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName),
            title: const Align(
                alignment: Alignment.topLeft, child: Icon(Icons.edit)),
            trailing: const Text(
              'Manager Product',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      elevation: 5,
    );
  }
}
