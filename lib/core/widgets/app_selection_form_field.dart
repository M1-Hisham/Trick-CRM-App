import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';

import '../cubits/show_fields.cubit.dart';
import '../resources/resources.dart';

class AppSelectionFormField extends StatefulWidget {
  final String? labelText;
  final List<dynamic> selections;
  final FormFieldSetter<dynamic>? onSaved;
  final String? Function(String?)? validator;
  final bool isRequired;
  final bool isChange;
  final Function(String?)? onChanged;
  final dynamic initialValue;
  const AppSelectionFormField({
    super.key,
    required this.labelText,
    required this.selections,
    required this.onSaved,
    this.validator,
    this.isRequired = false,
    this.isChange = true,
    this.onChanged,
    this.initialValue,
  });

  @override
  State<AppSelectionFormField> createState() => _AppSelectionFormFieldState();
}

class _AppSelectionFormFieldState extends State<AppSelectionFormField> {
  late final List<dynamic> _currencies = widget.selections;
  String? _selectedValue;
  @override
  void initState() {
    super.initState();

    final initialId = widget.initialValue is Map
        ? widget.initialValue['id'].toString()
        : widget.initialValue?.toString();

    bool existsInList = widget.selections.any((item) {
      final val =
          _isSpecialLabel(widget.labelText) ? item['id'].toString() : item;
      return val == initialId;
    });

    if (existsInList) {
      _selectedValue = initialId;
    }
  }

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
        label == 'Broker name' ||
        label == 'Current Status' ||
        label == 'Client Owner' ||
        label == 'Contact Owner' ||
        label == 'Call Owner' ||
        label == 'Lead' ||
        label == 'Contact' ||
        label == 'Client' ||
        label == 'Host' ||
        label == 'Deal' ||
        label == 'Client Name';
  }

  String? _currenciesFirst() {
    return widget.labelText == 'Lead Owner' ||
            widget.labelText == 'Broker Owner' ||
            widget.labelText == 'Client Owner' ||
            widget.labelText == 'Contact Owner'
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
            : FittedBox(
                fit: BoxFit.scaleDown, child: Text(widget.labelText ?? '')),
        labelStyle: const TextStyle(color: Colors.black),
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
          borderRadius: BorderRadius.circular(8),
          dropdownColor: R.colors.white,
          value: _currenciesFirst(),
          isDense: true,
          isExpanded: true,
          hint: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Select an option",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
          ),
          onChanged: widget.isChange
              ? (String? value) {
                  if (value != null) {
                    setState(() {
                      if (widget.labelText == 'Assign To') {
                        getIt<ShowFieldsCubit>().showFields();
                      }
                      _selectedValue = value;
                    });
                    widget.onChanged?.call(value);
                  }
                }
              : null,
          validator: widget.validator,
          onSaved: widget.onSaved,
          items: _currencies.map((dynamic value) {
            return DropdownMenuItem<String>(
              value: _isSpecialLabel(widget.labelText)
                  ? value['id'].toString()
                  : value,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  _isSpecialLabel(widget.labelText)
                      ? value['name'].toString()
                      : value,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
