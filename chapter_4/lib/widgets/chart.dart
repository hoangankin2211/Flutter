// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './char_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listTransactions;
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final DateTime weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (int i = 0; i < listTransactions.length; i++) {
        if (weekday.day == listTransactions[i].date.day &&
            weekday.month == listTransactions[i].date.month &&
            weekday.year == listTransactions[i].date.year) {
          totalSum += listTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  const Chart({Key? key, required this.listTransactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 15,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((data) {
          return ChartBar(
              label: data['day'].toString(),
              spendingAmount: data['amount'] as double,
              spendingPctOfTotal: (totalSpending == 0)
                  ? 0
                  : (data['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
