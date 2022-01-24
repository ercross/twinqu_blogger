part of '../page.dart';

class TitleTextField extends GetView<CreateBlogPostController> {
  const TitleTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      width: Get.width,
      child: Platform.isIOS
          ? CupertinoTextFormFieldRow(
              validator: controller.titleValidator,
              showCursor: true,
              onSaved: controller.onSavedTitle,
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
              onSaved: controller.onSavedTitle,
              cursorColor: kPrimaryColor,
              style: Get.textTheme.bodyText2,
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFEDEDED)),
                ),
                prefixText: "       ", // just for aesthetics
                label: Text("$title:", style: Get.textTheme.bodyText1),
                floatingLabelStyle: Get.textTheme.bodyText1,
              ),
            ),
    );
  }
}
