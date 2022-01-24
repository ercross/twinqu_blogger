import 'package:blogger/app/modules/auth/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';
import '../../../global_widgets/blank_page.dart';
import '../../../global_widgets/buttons.dart';
import '../../../global_widgets/key_value_widgets_horizontal.dart';
import 'widgets/text_fields.dart';

part 'widgets/alternative_login_buttons.dart';
part 'widgets/remember_me.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlankPage(
          withPadding: true,
          withSafeArea: true,
          builder: (pageHeight, pageWidth) {
            return Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(login, style: theme.textTheme.headline3)),
                  const SizedBox(height: 61),
                  PlatformTextField(
                      height: 51,
                      validator: controller.validateEmail,
                      suffixIcon: const Icon(Icons.email_outlined),
                      width: double.infinity,
                      inputType: TextInputType.emailAddress,
                      onSaved: controller.onSavedEmail,
                      hint: email),
                  const SizedBox(height: 16),
                  PlatformPasswordTextField(
                    height: 51,
                    validator: controller.validatePassword,
                    width: double.infinity,
                    onSaved: controller.onSavedPassword,
                  ),
                  const SizedBox(height: 37),
                  const _Line(),
                  const SizedBox(height: 32),
                  CurvedButton(
                      height: 51,
                      width: double.infinity,
                      color: kPrimaryColor,
                      child: Text(login, style: theme.textTheme.button),
                      onPressed: controller.login),
                  const SizedBox(height: 23),
                  Text(orLoginWith,
                      style: theme.textTheme.bodyText1!.copyWith(
                          fontSize: 13, color: const Color(0xFF8E8CA3))),
                  const SizedBox(height: 24),
                  const AlternativeLoginButtons()
                ],
              ),
            );
          }),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const RememberMe(),
        InkWell(
          onTap: () {},
          child: Text(forgotPassword,
              style: Get.textTheme.bodyText1!.copyWith(color: kPrimaryColor)),
        )
      ],
    );
  }
}
