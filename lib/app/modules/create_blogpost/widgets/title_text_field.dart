part of '../page.dart';

class TitleTextField extends GetView<CreateBlogPostController> {
  const TitleTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: Get.width,
      child: Platform.isIOS
          ? CupertinoTextFormFieldRow(
              validator: controller.titleValidator,
              showCursor: true,
              onSaved: controller.onSavedTitle,
              onChanged: controller.onTitleTextFieldChanged,
              minLines: 1,
              maxLines: 3,
              maxLength: 55,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFEDEDED)))),
              cursorColor: kPrimaryColor,
              padding: const EdgeInsets.only(top: 10),
              style: Get.textTheme.bodyText2,
            )
          : TextFormField(
              validator: controller.titleValidator,
              showCursor: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: controller.onSavedTitle,
              cursorColor: kPrimaryColor,
              minLines: 1,
              maxLines: 3,
              maxLength: 55,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              onChanged: controller.onTitleTextFieldChanged,
              style: Get.textTheme.bodyText2,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFEDEDED)),
                ),
                errorStyle:
                    Get.textTheme.subtitle1!.copyWith(color: Colors.red),
                prefixText: "       ", // just for aesthetics
                label: Text("$title:", style: Get.textTheme.bodyText1),
                floatingLabelStyle: Get.textTheme.bodyText1,
              ),
            ),
    );
  }
}
