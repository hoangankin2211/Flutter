// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {
  final Function(TextEditingController, TextEditingController, DateTime)
      updateTransaction;
  TransactionInput({Key? key, required this.updateTransaction})
      : super(key: key);

  @override
  State<TransactionInput> createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  var selectedDate = null;

  void addTrans(BuildContext context) {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0 ||
        selectedDate == null) {
      return;
    }

    widget.updateTransaction(titleController, amountController, selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDateChosen(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return null;

      setState(() {
        selectedDate = pickedDate;
      });
      return;
    });
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
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Text(selectedDate == null
                      ? 'NO DATE CHOSEN!'
                      : DateFormat.yMd().format(selectedDate)),
                ),
                FlatButton(
                  onPressed: () => _presentDateChosen(context),
                  child: Text('CHOSE DATE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
          FlatButton(
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            onPressed: () => addTrans(context),
            child: Text('Add new transaction'),
          )
        ],
      ),
    );
  }
}
