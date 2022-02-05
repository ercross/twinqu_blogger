import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../data/models/blogpost.dart';
import '../../global_widgets/blank_page.dart';
import '../../global_widgets/overlays.dart';
import '../../global_widgets/platform_app_bar.dart';
import 'controller.dart';

part 'widgets/body_text_field.dart';
part 'widgets/custom_image_picker.dart';
part 'widgets/title_text_field.dart';

class EditBlogPostPage extends GetView<EditBlogPostController> {
  /// [EditBlogPostPage] expects an instance of [BlogPost]
  /// from its [ModalRoute]
  const EditBlogPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppOverlay.context = context;
    final BlogPost post = Get.arguments as BlogPost;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlankPage(
        appBar: PlatformAppBar(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            widgets: [
              InkWell(
                onTap: Get.back,
                child: Text(
                  cancel,
                  style: Get.textTheme.button!.copyWith(color: kPrimaryColor),
                ),
              ),
              Text(editPost,
                  style: Get.textTheme.button!
                      .copyWith(color: const Color(0xFF0A1330))),
              InkWell(
                onTap: () => controller.updatePost(post.id ?? ""),
                child: Text(
                  update,
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
              children: [
                const SizedBox(height: 42),
                CustomImagePicker(post.imageUrl),
                const SizedBox(height: 16),
                TitleTextField(post.title),
                Expanded(
                    child:
                        SingleChildScrollView(child: BodyTextField(post.body)))
              ],
            ),
          );
        },
      ),
    );
  }
}
