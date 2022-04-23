// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  TransactionList({Key? key, required this.transactions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'NO TRANSACTION YET !!!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  child: Image.asset(
                    'assets/images/pngegg.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return FlatButton(
                  onPressed: () {},
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    elevation: 5,
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '${transactions[index].amount.round()} VNĐ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      title: Align(
                        alignment: Alignment.center,
                        child: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                            DateFormat().format(transactions[index].date),
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
