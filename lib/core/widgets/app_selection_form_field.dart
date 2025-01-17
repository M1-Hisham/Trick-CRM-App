import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

class AppSelectionFormField extends StatefulWidget {
  final String? labelText;
  final List<String> selections;
  final FormFieldSetter<String>? onSaved;
  const AppSelectionFormField({
    super.key,
    required this.labelText,
    required this.selections,
    required this.onSaved,
  });

  @override
  State<AppSelectionFormField> createState() => _AppSelectionFormFieldState();
}

class _AppSelectionFormFieldState extends State<AppSelectionFormField> {
  late final List<String> _currencies = widget.selections;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: widget.labelText ?? '',
        labelStyle: R.textStyles.font14DimGrayW400.copyWith(
          color: const Color(0XFF2C2E32),
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
        hintStyle: R.textStyles.font15RegentGrayW500,
        filled: true,
        fillColor: R.colors.white,
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 139, 139, 139),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 139, 139, 139),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color(0xFFE8ECF4),
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
          ),
          dropdownColor: R.colors.white,
          value: _selectedValue ?? _currencies.first,
          isDense: true,
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _selectedValue = value;
              });
            }
          },
          onSaved: widget.onSaved,
          items: _currencies.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
