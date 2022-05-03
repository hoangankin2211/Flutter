import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_detail.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(Transaction) deleteSingleElement;
  const TransactionList(
      {Key? key, required this.transactions, required this.deleteSingleElement})
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          child: transactions.isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                      child: Text(
                        'NO TRANSACTION YET !!!',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/pngegg.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return TransactionItem(
                        deleteSingleElement: deleteSingleElement,
                        transaction: transactions[index]);
                  },
                  itemCount: transactions.length,
                ),
        );
      },
    );
  }
}
