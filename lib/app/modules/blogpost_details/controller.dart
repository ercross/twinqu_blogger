import 'package:blogger/app/data/repository/blogpost.dart';
import 'package:blogger/app/global_widgets/overlays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailsPageController extends GetxController {
  final BlogPostRepository repo;

  DetailsPageController(this.repo);

  void deletePost(String? id) {
    AppOverlay().showActionDialog(
        title: "",
        contentReplacement: Text("Are you sure you want to delete this post",
            style: Get.textTheme.headline6),
        actions: {
          "CANCEL": () {},
          "YES": () {
            final overlay = AppOverlay.loading();
            repo.deletePostByID(id).then((value) {
              AppOverlay.dismiss(overlay);
              AppOverlay().showInfoDialog(
                  title: "Success",
                  content: "Your blogpost has been deleted successfully");
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
