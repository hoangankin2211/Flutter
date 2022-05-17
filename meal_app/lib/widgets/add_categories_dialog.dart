import 'package:flutter/material.dart';

class AddCategoriesDialog extends StatelessWidget {
  AddCategoriesDialog({Key? key}) : super(key: key);

  final title = TextEditingController();
  final ID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: title,
              autofocus: true,
              decoration: const InputDecoration(label: Text('ID Category'),focusColor: Colors.),
            ),
            TextField(
              controller: ID,
              autofocus: true,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Add category'),
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
