import '../../../global_widgets/overlays.dart';
import '../../../routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _password;
  String? _email;

  void login() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      AppOverlay().showInfoDialog(
          title: "Note",
          onPressed: () {
            final overlay = AppOverlay.loading();
            Future.delayed(const Duration(seconds: 4)).then((_) {
              AppOverlay.dismiss(overlay);
              Get.offAllNamed(Routes.home);
              AppOverlay().snackbarWithoutContext(
                  "Sign in successful. Welcome back Borris Johnson");
            });
          },
          content:
              "Please note that this authentication is just a mock of client-server communication");
    }
  }

  void onSavedEmail(String? input) {
    _email = input;
  }

  void onSavedPassword(String? input) {
    _password = input;
  }

  String? validatePassword(String? input) {
    if (input != null && input.isNotEmpty && input.length > 7) {
      return null;
    } else {
      return "password must be greater than 7 characters";
    }
  }

  String? validateEmail(String? input) {
    if (_isValidEmail(input)) {
      return null;
    } else {
      return "please enter any valid email address";
    }
  }

  bool _isValidEmail(String? email) {
    if (email == null) return false;
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }
}
