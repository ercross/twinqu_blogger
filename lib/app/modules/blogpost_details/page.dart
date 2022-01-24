import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modals/modals.dart';

import '../../core/values/strings.dart';
import '../../data/models/blogpost.dart';
import '../../global_widgets/blank_page.dart';
import '../../global_widgets/key_value_widgets_horizontal.dart';
import '../../global_widgets/meta_data.dart';
import '../../global_widgets/overlays.dart';
import '../../global_widgets/platform_app_bar.dart';
import '../../global_widgets/profile_avatar.dart';
import '../../routes/routes.dart';
import 'controller.dart';

part 'widgets/blog_picture.dart';
part 'widgets/bottom_widget.dart';
part 'widgets/menu_option.dart';

class BlogPostDetailsPage extends StatelessWidget {
  /// [BlogPostDetailsPage] expects an instance of [BlogPost]
  /// from its [ModalRoute] argument.
  const BlogPostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppOverlay.context = context;
    final BlogPost blogPost = Get.arguments as BlogPost;

    return BlankPage(
        withPadding: true,
        withSafeArea: true,
        bottomNavBar: const BottomWidget(),
        appBar: PlatformAppBar(
          sidePadding: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          widgets: [
            FloatingActionButton(
                mini: true,
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF0A1330),
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                onPressed: () => Get.offNamed(Routes.home)),
            Text(
              details,
              style: Get.textTheme.button!
                  .copyWith(color: const Color(0xFF0a1330)),
            ),
            FloatingActionButton(
                mini: true,
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF0A1330),
                child: const Icon(Icons.keyboard_control_rounded, size: 18),
                onPressed: () => _showOptions(context, blogPost)),
          ],
        ),
        builder: (pageHeight, pageWidth) {
          return Column(
            children: [
              const SizedBox(height: 24),
              BlogPicture(blogPost.imageUrl),
              Text(blogPost.title, style: Get.textTheme.headline6),
              const SizedBox(height: 10),
              BlogPostMetaData(
                  likes: blogPost.likes,
                  comments: blogPost.comments,
                  created: blogPost.created),
              const SizedBox(height: 12),
              KeyValueWidgetsHorizontal(
                title: ProfileAvatar(blogPost.creatorPicsUrl),
                value: Text(blogPost.createdBy, style: Get.textTheme.subtitle1),
              ),
              const SizedBox(height: 16),
              Expanded(child: Scrollable(viewportBuilder: (_, offset) {
                return Text(blogPost.body,
                    softWrap: true,
                    style: Get.textTheme.caption!.copyWith(color: Colors.grey));
              })),
            ],
          );
        });
  }

  void _showOptions(BuildContext context, BlogPost blogPost) {
    showModal(ModalEntry.positioned(context,
        tag: 'menuOptions',
        right: 19,
        top: 116,
        barrierDismissible: true,
        barrierColor: Colors.black38,
        child: MenuOptions(
          modalTag: 'menuOptions',
          blogPost: blogPost,
        )));
  }
}
