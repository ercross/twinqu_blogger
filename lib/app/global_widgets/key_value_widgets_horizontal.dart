import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyValueWidgetsHorizontal extends StatelessWidget {
  final Widget title;
  final Widget value;
  final bool spaceBetween;
  final double spaceBetweenAlternative;
  const KeyValueWidgetsHorizontal(
      {required this.title,
      required this.value,
      this.spaceBetweenAlternative = 8,
      this.spaceBetween = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: spaceBetween
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        title,
        if (!spaceBetween) SizedBox(width: spaceBetweenAlternative),
        value,
      ],
    );
  }
}
