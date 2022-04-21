// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function(TextEditingController, TextEditingController)
      updateTransaction;
  TransactionInput({Key? key, required this.updateTransaction})
      : super(key: key);

  void addTrans(BuildContext context) {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0) {
      return;
    }

    updateTransaction(titleController, amountController);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => addTrans,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            onSubmitted: (_) => addTrans,
          ),
          FlatButton(
            onPressed: () => addTrans(context),
            child: Text('Add new transaction'),
          )
        ],
      ),
    );
  }
}
