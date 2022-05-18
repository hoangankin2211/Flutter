import 'package:flutter/material.dart';

class AddMealCatalog extends StatefulWidget {
  const AddMealCatalog({Key? key}) : super(key: key);
  @override
  State<AddMealCatalog> createState() => _AddMealCatalogState();
}

class _AddMealCatalogState extends State<AddMealCatalog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.9,
        color: Colors.white54,
        child: const Center(child: Text('Add meal')),
      ),
    );
  }
}
