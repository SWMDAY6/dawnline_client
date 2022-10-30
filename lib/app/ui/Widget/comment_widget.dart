import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef PostClickFunction = void Function();

class CommentWidget extends StatelessWidget {
  final String content;

  const CommentWidget({
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 20,
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                content,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
