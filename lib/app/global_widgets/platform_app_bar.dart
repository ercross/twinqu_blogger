import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PlatformAppBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  /// [widgets] are arranged horizontally in the AppBar.
  /// Internally, widgets are arranged in a [Row] widget.
  /// This enables usage of auto-sizing widgets like
  /// [Flexible] and [Expanded]
  final List<Widget> widgets;

  /// padding to the right and left of the appBar
  final double sidePadding;

  final MainAxisAlignment mainAxisAlignment;

  /// [PlatformAppBar] is an appbar compatible for both Android and iOS platform.
  /// Other platforms can get theirs from Buhari.
  const PlatformAppBar(
      {required this.widgets,
      this.sidePadding = 24,
      this.mainAxisAlignment = MainAxisAlignment.start,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          right: sidePadding,
          left: sidePadding),
      child: Row(mainAxisAlignment: mainAxisAlignment, children: widgets),
    );
  }

  @override
  Size get preferredSize => Size(25, Get.width);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
