import 'dart:io';

import 'package:blogger/app/core/values/colors.dart';
import 'package:blogger/app/global_widgets/overlays.dart';
import 'package:flutter/services.dart';
import 'controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/values/strings.dart';
import '../../global_widgets/blank_page.dart';
import '../../global_widgets/platform_app_bar.dart';

part 'widgets/image_picker.dart';
part 'widgets/title_text_field.dart';
part 'widgets/body_text_field.dart';

class CreateBlogPostPage extends GetView<CreateBlogPostController> {
  const CreateBlogPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppOverlay.context = context;
    final controller = Get.find<CreateBlogPostController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlankPage(
        appBar: PlatformAppBar(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            widgets: [
              InkWell(
                onTap: controller.onCancelPressed,
                child: Text(
                  cancel,
                  style: Get.textTheme.button!.copyWith(color: kPrimaryColor),
                ),
              ),
              Text(createPost,
                  style: Get.textTheme.button!
                      .copyWith(color: const Color(0xFF0A1330))),
              InkWell(
                onTap: controller.save,
                child: Text(
                  save,
                  style: Get.textTheme.button!.copyWith(color: kPrimaryColor),
                ),
              ),
            ]),
        withPadding: true,
        withSafeArea: true,
        builder: (pageHeight, pageWidth) {
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 42),
                CustomImagePicker(),
                SizedBox(height: 16),
                TitleTextField(),
                Expanded(child: BodyTextField())
              ],
            ),
          );
        },
      ),
    );
  }
}
