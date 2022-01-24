part of '../page.dart';

class BodyTextField extends GetView<CreateBlogPostController> {
  const BodyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextFormFieldRow(
            validator: controller.titleValidator,
            showCursor: true,
            minLines: 1,
            maxLines: 40,
            maxLength: 2500,
            onSaved: controller.onSavedBody,
            cursorColor: kPrimaryColor,
            padding: const EdgeInsets.only(top: 10),
            style: Get.textTheme.bodyText2,
          )
        : TextFormField(
            validator: controller.bodyValidator,
            showCursor: true,
            minLines: 1,
            maxLines: 40,
            maxLength: 2500,
            
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: controller.onSavedBody,
            cursorColor: kPrimaryColor,
            style: Get.textTheme.caption!.copyWith(height: 1.5),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 15, bottom: 10),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),
              errorStyle: Get.textTheme.subtitle1!.copyWith(color: Colors.red),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              label: Text(body, style: Get.textTheme.bodyText1),
              floatingLabelStyle: Get.textTheme.bodyText1,
            ),
          );
  }
}
