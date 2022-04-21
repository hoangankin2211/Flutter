import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_input.dart';
import './transaction_list.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  List<Transaction> transactions = [];
  void updateTransactions(titleController, amountController) {
    try {
      setState(() {
        transactions.add(Transaction(
            id: (transactions.length + 1).toString(),
            title: titleController.text,
            amount: double.parse(amountController.text),
            date: DateTime.now()));
      });
    } on FormatException catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionInput(updateTransaction: updateTransactions),
        TransactionList(transactions: transactions),
      ],
    );
  }
}
