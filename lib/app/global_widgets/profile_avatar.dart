import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const ProfileAvatar(this.imageUrl, {this.radius = 25, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      foregroundImage: Image.asset("assets/images/profile_pics.png").image,
    );
  }
}
