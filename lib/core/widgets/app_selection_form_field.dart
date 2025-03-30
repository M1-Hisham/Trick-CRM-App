import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/show_fields.cubit.dart';
import '../resources/resources.dart';

class AppSelectionFormField extends StatefulWidget {
  final String? labelText;
  final List<dynamic> selections;
  final FormFieldSetter<dynamic>? onSaved;
  final String? Function(String?)? validator;
  final bool isRequired;
  const AppSelectionFormField({
    super.key,
    required this.labelText,
    required this.selections,
    required this.onSaved,
    this.validator,
    this.isRequired = false,
  });

  @override
  State<AppSelectionFormField> createState() => _AppSelectionFormFieldState();
}

class _AppSelectionFormFieldState extends State<AppSelectionFormField> {
  late final List<dynamic> _currencies = widget.selections;
  String? _selectedValue;
  bool _isSpecialLabel(String? label) {
    return label == 'Lead Owner' ||
        label == 'Assign To' ||
        label == 'Assigned To' ||
        label == 'Campaign Name' ||
        label == 'Campaign Owner' ||
        label == 'Deal Owner' ||
        label == 'Borker' ||
        label == 'Campaign' ||
        label == 'Project Name' ||
        label == 'Unit Code' ||
        label == 'Broker Owner' ||
        label == 'Current Status' ||
        label == 'Client Name';
  }

  String? _currenciesFirst() {
    return widget.labelText == 'Lead Owner' ||
            widget.labelText == 'Broker Owner'
        ? _currencies.first['id'].toString()
        : _selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        label: widget.isRequired
            ? RichText(
                text: TextSpan(
                  text: widget.labelText,
                  style: const TextStyle(color: Colors.black),
                  children: const [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              )
            : Text(widget.labelText ?? ''),
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
          menuMaxHeight: 250,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
          ),
          dropdownColor: R.colors.white,
          value: _currenciesFirst(),
          isDense: true,
          hint: Text(
            "Select an option",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
          onChanged: (dynamic value) {
            if (value != null) {
              setState(() {
                widget.labelText == 'Assign To' && value != null
                    ? context.read<ShowFieldsCubit>().showFields()
                    : null;
                _selectedValue = value;
              });
            }
          },
          validator: widget.validator,
          onSaved: widget.onSaved,
          items: _currencies.map((dynamic value) {
            return DropdownMenuItem<String>(
              value: _isSpecialLabel(widget.labelText)
                  ? value['id'].toString()
                  : value,
              child: Text(
                _isSpecialLabel(widget.labelText)
                    ? value['name'].toString()
                    : value,
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
