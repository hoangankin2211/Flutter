import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './card_detail.dart';

class TransactionDetail extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetail({Key? key, required this.transaction})
      : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                height: constraints.maxHeight * 0.3,
                width: constraints.maxWidth * 0.5,
                child: Image.asset(
                  'assets/images/119324903-delicioso-desayuno-sabroso-dibujos-animados.png',
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.25,
                width: constraints.maxWidth * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardDetail(title: 'Name', content: transaction.title),
                    CardDetail(
                        title: 'Amount',
                        content: transaction.amount.toString()),
                    CardDetail(
                        title: 'Date',
                        content:
                            DateFormat().add_yMd().format(transaction.date)),
                    CardDetail(
                        title: 'Date create',
                        content: DateFormat()
                            .add_yMd()
                            .format(transaction.createDate)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
