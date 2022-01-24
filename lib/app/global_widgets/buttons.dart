import 'package:flutter/material.dart';

class CurvedButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget child;
  final double radius;

  final Function() onPressed;
  const CurvedButton({
    required this.height,
    this.radius = 15,
    required this.width,
    required this.color,
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: color),
        child: child,
      ),
    );
  }
}