import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Icon(
          Icons.hourglass_empty,
          size: 50,
        )),
      ],
    );
  }
}
