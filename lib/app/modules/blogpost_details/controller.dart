import 'package:blogger/app/modules/dashboard/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/blogpost.dart';
import '../../global_widgets/overlays.dart';
import '../../routes/routes.dart';

class DetailsPageController extends GetxController {
  final BlogPostRepository repo;

  DetailsPageController(this.repo);

  void deletePost(String? id) {
    AppOverlay().showActionDialog(
        title: "",
        contentReplacement: Text(
          "Are you sure you want to delete this post",
          style: Get.textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        actions: {
          "CANCEL": () {},
          "YES": () {
            final overlay = AppOverlay.loading();
            repo.deletePostByID(id).then((value) {
              Get.find<HomepageController>().refreshList();
              AppOverlay.dismiss(overlay);
              AppOverlay().snackbarWithoutContext(
                  "Your blogpost has been deleted successfully");
              Get.offNamed(Routes.home);
            }).onError((error, stackTrace) {
              AppOverlay.dismiss(overlay);
              AppOverlay().showInfoDialog(
                  title: "Error Encountered",
                  content:
                      "We are unable to delete this blogpost at this time. Please, try again later");
            });
          }
        });
  }
}
