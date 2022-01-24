import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:blogger/app/data/enums.dart';
import 'package:blogger/app/data/extensions.dart';
import 'package:blogger/app/data/models/blogpost.dart';
import 'package:blogger/app/global_widgets/meta_data.dart';
import 'package:blogger/app/global_widgets/profile_avatar.dart';
import 'package:blogger/app/modules/dashboard/home/controller.dart';
import 'package:blogger/app/routes/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';
import '../../../global_widgets/blank_page.dart';
import '../../../global_widgets/buttons.dart';
import '../../../global_widgets/key_value_widgets_horizontal.dart';
import '../../../global_widgets/platform_app_bar.dart';

part 'widgets/bottom_nav_bar.dart';
part 'widgets/search_tools.dart';
part 'widgets/breaking_news_card.dart';
part 'widgets/breaking_news.dart';
part 'widgets/category_post_card.dart';
part 'widgets/tab_indicator.dart';
part 'widgets/category_view.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<HomepageController>().refresh();
    return BlankPage(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.offNamed(Routes.createBlogpost);
          },
          foregroundColor: CupertinoColors.systemBackground,
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add, color: CupertinoColors.systemBackground),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavBar: const BottomNavBar(),
        appBar: PlatformAppBar(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            widgets: List.unmodifiable([
              KeyValueWidgetsHorizontal(
                  title: Text("$hello Sonia", style: Get.textTheme.headline6),
                  value: Text(
                    "👋",
                    style: Get.textTheme.headline6,
                  )),
              const ProfileAvatar("assets/images/profile_pics.png")
            ])),
        withSafeArea: true,
        builder: (pageHeight, pageWidth) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 33,
              ),
              const SearchTools(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  breakingNews,
                  style: Get.textTheme.headline6,
                ),
              ),
              const SizedBox(height: 18),
              const BreakingNews(),
              const SizedBox(height: 30),
              const PageTabIndicator(),
              const SizedBox(height: 23),
              const Expanded(child: CategoryView())
            ],
          );
        });
  }
}
