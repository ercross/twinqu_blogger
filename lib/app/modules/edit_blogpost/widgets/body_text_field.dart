part of '../page.dart';

class BodyTextField extends GetView<EditBlogPostController> {
  final String initial;
  const BodyTextField(this.initial, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextFormFieldRow(
            validator: controller.bodyValidator,
            showCursor: true,
            maxLines: 40,
            initialValue: initial,
            onSaved: controller.onSavedBody,
            cursorColor: kPrimaryColor,
            padding: const EdgeInsets.only(top: 10),
            style: Get.textTheme.bodyText2,
          )
        : TextFormField(
            validator: controller.bodyValidator,
            showCursor: true,
            maxLines: 40,
            initialValue: initial,
            onSaved: controller.onSavedBody,
            cursorColor: kPrimaryColor,
            style: Get.textTheme.caption,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 15, bottom: 10),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              label: Text(body, style: Get.textTheme.bodyText1),
              floatingLabelStyle: Get.textTheme.bodyText1,
            ),
          );
  }
}
