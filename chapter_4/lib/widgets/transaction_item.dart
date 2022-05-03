import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_detail.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Function(Transaction) deleteSingleElement;
  final Transaction transaction;
  const TransactionItem(
      {Key? key, required this.deleteSingleElement, required this.transaction})
      : super(key: key);

  void showDetailTransaction(BuildContext context, Transaction transaction) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: TransactionDetail(transaction: transaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDetailTransaction(context, transaction),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
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
            padding: const EdgeInsets.all(5),
            child: Text(
              '${transaction.amount.round()} VNĐ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          title: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              transaction.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          subtitle: Align(
            alignment: Alignment.bottomRight,
            child: Text(DateFormat.yMd().format(transaction.date),
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          trailing: IconButton(
            onPressed: () => deleteSingleElement(transaction),
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
