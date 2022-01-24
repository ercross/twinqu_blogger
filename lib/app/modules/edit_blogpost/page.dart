import 'dart:io';

import 'package:blogger/app/modules/create_blogpost/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../global_widgets/blank_page.dart';
import '../../global_widgets/platform_app_bar.dart';

part 'widgets/body_text_field.dart';
part 'widgets/document_picker.dart';
part 'widgets/title_text_field.dart';

class EditBlogPostPage extends StatelessWidget {

  /// [EditBlogPostPage] expects an instance of [BlogPost]
  /// from its [ModalRoute]
  const EditBlogPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlankPage(
      appBar: PlatformAppBar(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          widgets: [
            Text(
              cancel,
              style: Get.textTheme.button!.copyWith(color: kPrimaryColor),
            ),
            Text(editPost,
                style: Get.textTheme.button!
                    .copyWith(color: const Color(0xFF0A1330))),
            Text(
              save,
              style: Get.textTheme.button!.copyWith(color: kPrimaryColor),
            ),
          ]),
      withPadding: true,
      withSafeArea: true,
      builder: (pageHeight, pageWidth) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 42),
            CustomImagePicker(),
            SizedBox(height: 16),
            TitleTextField(),
            Expanded(child: SingleChildScrollView(child: BodyTextField()))
          ],
        );
      },
    );
  }
}
