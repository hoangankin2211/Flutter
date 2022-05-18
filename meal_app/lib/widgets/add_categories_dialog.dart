import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

class AddCategoriesDialog extends StatefulWidget {
  final Function(Category) addCategory;

  const AddCategoriesDialog({Key? key, required this.addCategory})
      : super(key: key);

  @override
  State<AddCategoriesDialog> createState() => _AddCategoriesDialogState();
}

class _AddCategoriesDialogState extends State<AddCategoriesDialog> {
  final title = TextEditingController();
  final id = TextEditingController();

  void _addCategoryCatalog() {
    if (id.text.isEmpty || title.text.isEmpty) return;

    widget.addCategory(Category(
      id: id.text,
      title: title.text,
      color: Colors.amber,
    ));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: id,
              autofocus: true,
              decoration: const InputDecoration(
                label: Text('ID Category'),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            TextField(
              controller: title,
              autofocus: true,
              decoration: const InputDecoration(
                label: Text('Title'),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            TextButton(
              onPressed: _addCategoryCatalog,
              child: const Text('Add category', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        color: Colors.white54,
      ),
    );
  }
}
