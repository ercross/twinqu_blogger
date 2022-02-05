import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../data/models/blogpost.dart';
import '../../data/repository/blogpost.dart';
import '../../global_widgets/overlays.dart';
import '../../routes/routes.dart';

class CreateBlogPostController extends GetxController {
  final BlogPostRepository repo;

  CreateBlogPostController(this.repo);

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

  String? imagePickerValidator(String? input) {
    if (input == null || input.isEmpty || input.length < 25) {
      return "open your gallery, pick an image. what are your hiding";
    }
    return null;
  }

  void onSavedImagePicker(String? input) {
    _inputs.addIf(input != null, "image_url", input);
  }

  /// check [onImageSelected] for initialization
  late File _imageFile;

  void save() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      final overlay = AppOverlay.loading();
      _inputs.putIfAbsent("created", () => DateTime.now().toIso8601String());
      _inputs.putIfAbsent(
          "creator_pics",
          () =>
              "https://firebasestorage.googleapis.com/v0/b/twinqu-blogger.appspot.com/o/7b2516812f97ce615a7205e0244cb975.jpg?alt=media&token=14181330-a48a-4f1b-aadb-f24933fe73f4");
      final BlogPost blogPost = BlogPost.fromJson(_inputs);

      final response = await repo.createPost(blogPost, _imageFile);
      if (response.isSuccessful) {
        AppOverlay.dismiss(overlay);
        AppOverlay().showInfoDialog(
            title: "success",
            content: "Your blogpost has been created successfully",
            buttonText: "View Post",
            onPressed: () =>
                Get.offNamed(Routes.blogpostDetails, arguments: response.data));
      } else {
        AppOverlay.dismiss(overlay);
        AppOverlay().showInfoDialog(
          title: "Error",
          content: "${response.msg}: ${response.errorMsg}",
        );
      }
    }
  }

  // ************* the code starting from here is used to implement the cancel
  // button on page.dart *************
  // These fields are used to detect if the current user has already entered
  // some characters into any of the textfields on page.dart.
  // If true, the user is alerted that confirming the cancel button
  // may lead to loss of any progress.
  String? _title;
  String? _body;
  String? _imageName;

  void onTitleTextFieldChanged(String? title) {
    _title = title;
  }

  void onBodyTextFieldChanged(String? body) {
    _body = body;
  }

  void onImageSelected(String? filepath, File file) {
    _imageName = filepath;
    _imageFile = file;
  }

  void onCancelPressed() {
    if ((_title != null || _body != null || _imageName != null) &&
        (_title!.isNotEmpty || _body!.isNotEmpty || _imageName!.isNotEmpty)) {
      AppOverlay().showInfoDialog(
          title: "Confirm cancel",
          content:
              "If you proceed to cancel, you will loose your current progress",
          buttonText: "Yes, cancel",
          onPressed: () => Get.offNamed(Routes.home));
    } else {
      Get.offNamed(Routes.home);
    }
  }
}
