import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/values/colors.dart';
import '../../../../core/values/strings.dart';

class PlatformTextField extends StatelessWidget {
  final double height;
  final double width;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  final int? maxLines;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final TextInputType inputType;
  final Function(String) onSaved;
  final String hint;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;

  /// presently, [suffixIcon] only works on Android.
  final Widget? suffixIcon;
  final String? purpose;
  final TextAlign textAlign;

  const PlatformTextField(
      {required this.height,
      required this.width,
      this.hintStyle,
      this.controller,
      this.maxLength,
      this.maxLines,
      this.textCapitalization,
      this.validator,
      this.inputFormatters,
      this.contentPadding,
      this.prefix,
      this.suffixIcon,
      this.textAlign = TextAlign.left,
      required this.inputType,
      required this.onSaved,
      this.purpose,
      required this.hint,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = Get.textTheme;
    return SizedBox(
      height: height,
      width: width,
      child: Platform.isIOS
          ? CupertinoTextFormFieldRow(
              inputFormatters: inputFormatters,
              validator: validator,
              showCursor: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (input) {
                if (input != null && input.isNotEmpty) {
                  onSaved(input.trim());
                }
              },
              decoration: BoxDecoration(
                  color: kTextFieldFillColor,
                  borderRadius: BorderRadius.circular(15)),
              controller: controller,
              cursorColor: Colors.black,
              keyboardType: inputType,
              maxLines: maxLines,
              maxLength: maxLength,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              padding: const EdgeInsets.only(top: 10),
              placeholder: hint,
              textAlign: textAlign,
              prefix: prefix,
              placeholderStyle: texts.caption,
              style: texts.bodyText2,
            )
          : TextFormField(
              inputFormatters: inputFormatters,
              validator: validator,
              keyboardType: inputType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (input) {
                if (input != null && input.isNotEmpty) {
                  onSaved(input.trim());
                }
              },
              maxLines: 1,
              maxLength: maxLength,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              controller: controller,
              cursorColor: Colors.black,
              style: texts.bodyText2,
              textAlign: textAlign,
              decoration: InputDecoration(
                fillColor: kTextFieldFillColor,
                filled: true,
                errorStyle:
                    Get.textTheme.subtitle1!.copyWith(color: Colors.red),
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 24),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.7)),
                suffixIcon: suffixIcon,
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.7)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                hintText: hint,
                prefix: prefix,
                hintStyle: hintStyle ?? texts.caption,
              ),
            ),
    );
  }
}

class PlatformPasswordTextField extends StatefulWidget {
  final double height;
  final double width;
  final String? Function(String?)? validator;

  final Function(String) onSaved;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  const PlatformPasswordTextField(
      {required this.height,
      required this.width,
      this.hintStyle,
      this.validator,
      this.contentPadding,
      required this.onSaved,
      Key? key})
      : super(key: key);

  @override
  State<PlatformPasswordTextField> createState() =>
      _PlatformPasswordTextFieldState();
}

class _PlatformPasswordTextFieldState extends State<PlatformPasswordTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final texts = Get.textTheme;
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Platform.isIOS
          ? CupertinoTextFormFieldRow(
              validator: widget.validator,
              showCursor: true,
              onSaved: (input) {
                if (input != null && input.isNotEmpty) {
                  widget.onSaved(input.trim());
                }
              },
              prefix: InkWell(onTap: _toggleVisibility),
              decoration: BoxDecoration(
                  color: kTextFieldFillColor,
                  borderRadius: BorderRadius.circular(15)),
              cursorColor: Colors.black,
              maxLines: 1,
              obscureText: _isObscured,
              padding: const EdgeInsets.only(top: 10),
              placeholder: password,
              placeholderStyle: texts.caption,
              style: texts.bodyText2,
            )
          : TextFormField(
              validator: widget.validator,
              onSaved: (input) {
                if (input != null && input.isNotEmpty) {
                  widget.onSaved(input.trim());
                }
              },
              maxLines: 1,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorColor: Colors.black,
              style: texts.bodyText2,
              obscureText: _isObscured,
              decoration: InputDecoration(
                fillColor: kTextFieldFillColor,
                filled: true,
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 24),
                suffixIcon: InkWell(
                  onTap: _toggleVisibility,
                  child: Icon(_isObscured
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                ),
                errorStyle:
                    Get.textTheme.subtitle1!.copyWith(color: Colors.red),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.7)),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.7)),
                focusedBorder: OutlineInputBorder(
                    gapPadding: 24,
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    gapPadding: 24,
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                hintText: password,
                hintStyle: widget.hintStyle ?? texts.caption,
              ),
            ),
    );
  }

  void _toggleVisibility() {
    if (_isObscured == true) {
      setState(() => _isObscured = false);
    } else {
      setState(() => _isObscured = true);
    }
  }
}
