import 'package:flutter/widgets.dart';

typedef PostClickFunction = void Function();

class PostWidget extends StatelessWidget {
  final String content;
  final PostClickFunction callBack;

  const PostWidget({
    required this.content,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image.asset(thumbnail),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text(
                  //   title,
                  //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  // ),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
