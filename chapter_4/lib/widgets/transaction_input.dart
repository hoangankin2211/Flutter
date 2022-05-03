// ignore_for_file: avoid_init_to_null
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {
  final Function(
          TextEditingController, TextEditingController, DateTime, DateTime)
      updateTransaction;
  const TransactionInput({Key? key, required this.updateTransaction})
      : super(key: key);

  @override
  State<TransactionInput> createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  var selectedDate = null;

  var createDate = null;

  void addTrans(BuildContext context) {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0 ||
        selectedDate == null) {
      return;
    }

    widget.updateTransaction(
        titleController, amountController, selectedDate, createDate);

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
        createDate = DateTime.now();
      });
      return;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => addTrans,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
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
                    TextButton(
                      onPressed: () => _presentDateChosen(context),
                      child: const Text('CHOSE DATE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => addTrans(context),
                child: Text(
                  'Add new transaction',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
