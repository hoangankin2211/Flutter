import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  final String title;
  final String content;
  const CardDetail({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight * 0.2,
            child: Text('$title: $content'),
          );
        },
      ),
    );
  }
}
