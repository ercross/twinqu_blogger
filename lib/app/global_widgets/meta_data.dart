import 'package:blogger/app/global_widgets/key_value_widgets_horizontal.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogPostMetaData extends StatelessWidget {
  final String likes;
  final String comments;
  final DateTime created;
  const BlogPostMetaData(
      {required this.likes,
      required this.comments,
      required this.created,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 16;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        KeyValueWidgetsHorizontal(
            title: const Icon(Icons.thumb_up_alt_outlined, size: size),
            value: Text(likes, style: Get.textTheme.subtitle1)),
        KeyValueWidgetsHorizontal(
            title: const Icon(
              CupertinoIcons.chat_bubble_2,
              size: size,
            ),
            value: Text(comments, style: Get.textTheme.subtitle1)),
        KeyValueWidgetsHorizontal(
          title: const Icon(Icons.today_outlined, size: 18),
          spaceBetweenAlternative: 5,
          value: Text(
              DateTimeFormat.format(
                created,
                format: AmericanDateFormats.abbr,
              ),
              style: Get.textTheme.subtitle1),
        ),
      ],
    );
  }
}
