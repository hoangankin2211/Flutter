// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './widgets/transaction_list.dart';
import './widgets/transaction_input.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

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
        primaryColor: Colors.blueGrey,
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Roboto',
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

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void updateTransactions(titleController, amountController, selectedDate) {
    try {
      setState(() {
        transactions.add(Transaction(
            id: (transactions.length + 1).toString(),
            title: titleController.text,
            amount: double.parse(amountController.text),
            date: selectedDate));
      });
    } on FormatException catch (e) {
      print('Error: $e');
    }
  }

  void deleteAllTransaction() {
    setState(() {
      transactions.removeRange(0, transactions.length);
    });
  }

  void deleteSingleTransaction(Transaction deleteElement) {
    setState(() {
      transactions.removeWhere((element) => element == deleteElement);
    });
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

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(title,
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700)),
      actions: [
        IconButton(
          onPressed: () => startAddNewTransaction(context),
          icon: Icon(Icons.add_box_outlined),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Show chart'),
              Switch(
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  }),
            ],
          ),
          _showChart
              ? Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height) *
                      0.25,
                  child: Chart(
                    listTransactions: _recentTransactions,
                  ),
                )
              : Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height) *
                      0.75,
                  child: TransactionList(
                    transactions: transactions,
                    deleteSingleElement: deleteSingleTransaction,
                  ),
                ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: FloatingActionButton(
              child: Icon(Icons.add_circle_sharp),
              onPressed: () => startAddNewTransaction(context),
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.clear_rounded),
            onPressed: deleteAllTransaction,
          ),
        ],
      ),
    );
  }
}

////////////

