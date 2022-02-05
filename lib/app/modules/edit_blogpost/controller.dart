import 'package:blogger/app/data/repository/blogpost.dart';
import 'package:blogger/app/global_widgets/overlays.dart';
import 'package:blogger/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditBlogPostController extends GetxController {
  final BlogPostRepository repo;

  EditBlogPostController(this.repo);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _inputs = {};

  String? titleValidator(String? input) {
    if (input == null || input.isEmpty || input.length < 5) {
      return "I don't have a eyes but I can see this short title";
    }
    return null;
  }

  void onSavedTitle(String? input) {
    _inputs.addIf(input != null, "title", input);
  }

  String? bodyValidator(String? input) {
    if (input == null || input.isEmpty || input.length < 25) {
      return "Haba, oga put jara. This body is too short";
    }
    return null;
  }

  void onSavedBody(String? input) {
    _inputs.addIf(input != null, "body", input);
  }

  void onSavedImagePicker(String? input) {
    _inputs.addIf(input != null, "image_url", input);
  }

  void updatePost(String id) async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      final overlay = AppOverlay.loading();

      await repo.updatePost(_inputs, id).then((value) {
        AppOverlay.dismiss(overlay);
        AppOverlay().showInfoDialog(
            title: "success",
            content: "Your blogpost has been updated successfully",
            buttonText: "Home",
            onPressed: () => Get.offNamed(Routes.home));
      }).onError((error, stackTrace) {
        AppOverlay.dismiss(overlay);
        AppOverlay().showInfoDialog(
          title: "Error",
          content:
              "Error encountered while updating your blogpost. Please try again later.",
        );
      });
    }
  }
}
