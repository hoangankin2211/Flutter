import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  final String step;
  final int index;
  const StepItem({Key? key, required this.step, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Text(
                '#$index',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              step,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
