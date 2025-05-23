import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

/// Generic TextFormField
class AppTextFormField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String? initialValue;
  final bool? isObscureText;
  final bool? isclickable;
  final bool isRequired;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final Color? hoverColor;
  final Color? fillColor;
  final Color? colorEnableBorder;
  final Color? disabledBorder;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final int? maxLines;
  final FormFieldSetter<String>? onSaved;
  final Key? valueKey;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.contentPadding,
    this.isObscureText,
    this.hintStyle,
    this.style,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.validator,
    this.cursorColor,
    this.cursorErrorColor,
    this.hoverColor,
    this.fillColor,
    this.focusNode,
    this.nextFocusNode,
    this.colorEnableBorder,
    this.labelText,
    this.maxLines,
    this.onSaved,
    this.valueKey,
    this.isclickable,
    this.disabledBorder,
    this.initialValue,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: valueKey,
      initialValue: initialValue,
      enabled: isclickable,
      onFieldSubmitted: (value) =>
          FocusScope.of(context).requestFocus(nextFocusNode),
      focusNode: focusNode,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        label: isRequired
            ? RichText(
                text: TextSpan(
                  text: labelText,
                  style: const TextStyle(color: Colors.black),
                  children: const [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              )
            : Text(labelText ?? hintText),
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.black),
        // R.textStyles.font14DimGrayW400.copyWith(
        //   color: const Color(0XFF2C2E32),
        //   fontSize: 15.sp,
        //   fontWeight: FontWeight.bold,
        // ),
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
        hintStyle: hintStyle ?? R.textStyles.font15RegentGrayW500,
        suffixIcon: suffixIcon,
        hoverColor: hoverColor ?? R.colors.primaryColor,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        alignLabelWithHint: true,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 139, 139, 139),
          ),
          // borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 139, 139, 139),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: colorEnableBorder ?? const Color(0xFFE8ECF4),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: disabledBorder ?? const Color.fromARGB(255, 139, 139, 139),
          ),
        ),
      ),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      style: style,
      obscureText: isObscureText ?? false,
      cursorColor: cursorColor ?? R.colors.primaryColor,
      cursorErrorColor: cursorErrorColor ?? R.colors.red,
      validator: (value) {
        return validator?.call(value);
      },
    );
  }
}
