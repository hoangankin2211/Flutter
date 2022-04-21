// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/transaction_input.dart';
import './models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String title = 'Expense App';
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

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TransactionInput(updateTransaction: updateTransactions),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: [
        IconButton(
          onPressed: () => startAddNewTransaction(context),
          icon: Icon(Icons.add_box_outlined),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                child: Center(
                  child: Text('Element 1'),
                ),
                color: Colors.grey,
                elevation: 5,
              ),
            ),
            TransactionList(transactions: transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_sharp),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}

////////////

