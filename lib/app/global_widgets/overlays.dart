import 'package:blogger/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buttons.dart';

class AppOverlay {
  static late BuildContext context;

  void snackbarWithoutContext(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        style: Get.textTheme.subtitle1!.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.black54,
    ));
  }

  /// Either [content] or [contentReplacement] must not be null.
  /// If both are provided, [contentReplacement] take precedent
  void showInfoDialog(
      {required String title,
      String? content,
      Widget? contentReplacement,
      Function()? onPressed,
      String? buttonText}) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (context) => Material(
        elevation: 10,
        color: Colors.black38,
        child: Center(
          child: IntrinsicHeight(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.1),
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.03,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white70),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.bodyText2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Center(
                      child: contentReplacement ??
                          Text(content ?? "",
                              textAlign: TextAlign.center,
                              style: Get.textTheme.subtitle1),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  CurvedButton(
                      height: height * 0.06,
                      width: width * 0.6,
                      radius: 8,
                      color: kPrimaryColor,
                      child: Text(buttonText ?? "OKAY",
                          textAlign: TextAlign.center,
                          style: Get.textTheme.caption!
                              .copyWith(color: Colors.white)),
                      onPressed: onPressed ?? Get.back),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Each action in [actions] invokes the dismissal of the overlay
  /// prior to executing their actual onPressed.
  /// Either [content] or [contentReplacement] must be provided.
  /// If [content] is not null, it takes precedence over [contentReplacement].
  void showActionDialog(
      {required String title,
      String? content,
      Widget? contentReplacement,
      required Map<String, Function()> actions}) {
    assert(content != null || contentReplacement != null,
        "either content or contentReplacement must be provided");
    if (actions.length == 1) {
      showInfoDialog(
          title: title,
          content: content,
          buttonText: actions.keys.first,
          onPressed: actions.values.first);
      return;
    }

    final double height = Get.height;
    final double width = Get.width;
    List<Widget> buttons = [];
    actions.forEach((text, onPressed) {
      buttons.add(CurvedButton(
          radius: 8,
          height: height * 0.05,
          width: (width * 0.65) / actions.length,
          color: kPrimaryColor,
          child: Text(text,
              textAlign: TextAlign.center,
              style: Get.textTheme.caption!.copyWith(color: Colors.white)),
          onPressed: () {
            Get.back();
            onPressed();
          }));
    });
    Get.dialog(Material(
      elevation: 10,
      color: Colors.black38,
      child: Center(
        child: IntrinsicHeight(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            padding: EdgeInsets.symmetric(
              vertical: height * 0.02,
              horizontal: width * 0.03,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white70),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.headline6!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                if (content == null)
                  Expanded(child: contentReplacement ?? const SizedBox()),
                if (content != null)
                  Expanded(
                    child: Center(
                      child: Text(content,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.subtitle1),
                    ),
                  ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: buttons,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  /// pass [OverlayEntry] returned from [loading] to [dismiss]
  /// this overlay
  static OverlayEntry loading() {
    final double pageHeight = Get.height;
    final double pageWidth = Get.width;
    OverlayState? overlay = Overlay.of(context);
    OverlayEntry entry = OverlayEntry(builder: (_) {
      return Positioned(
          top: 0,
          left: 0,
          height: pageHeight,
          width: pageWidth,
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(15),
            color: Colors.black12,
            child: Center(
                child: Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(60),
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(15)),
              child: const CircularProgressIndicator.adaptive(
                strokeWidth: 2,
              ),
            )),
          ));
    });

    overlay!.insert(entry);

    return entry;
  }

  static void dismiss(OverlayEntry overlay) {
    overlay.remove();
  }
}
