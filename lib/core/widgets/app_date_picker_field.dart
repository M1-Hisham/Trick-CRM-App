import 'package:flutter/material.dart';

import '../resources/resources.dart';
import 'app_text_form_field.dart';

class AppDatePickerField extends StatefulWidget {
  final Function(String?)? onSaved;
  final String? hintText;
  final bool? validator;
  final bool isRequired;
  final String? initialValue;
  const AppDatePickerField({
    super.key,
    required this.onSaved,
    this.hintText,
    this.validator,
    this.isRequired = false,
    this.initialValue,
  });

  @override
  State<AppDatePickerField> createState() => _AppDatePickerFieldState();
}

class _AppDatePickerFieldState extends State<AppDatePickerField> {
  String? selectedDate;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AppTextFormField(
        isRequired: widget.isRequired,
        controller:
            TextEditingController(text: selectedDate ?? widget.initialValue),
        isclickable: false,
        labelText: widget.hintText ?? 'Due Date',
        hintText: widget.hintText ?? 'Due Date',
        style: R.textStyles.font15RegentGrayW500.copyWith(
          color: R.colors.black,
        ),
        suffixIcon: Icon(
          Icons.calendar_month_outlined,
          color: R.colors.primaryColor,
        ),
        fillColor: R.colors.white,
        disabledBorder: const Color(0xFFE8ECF4),
        onSaved: widget.onSaved,
        validator: widget.isRequired
            ? (value) {
                if (widget.validator != false) {
                  if (selectedDate == null || selectedDate!.isEmpty) {
                    return 'Please enter a valid date';
                  }
                }
                return null;
              }
            : null,
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: R.colors.primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: R.colors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );

    if (date != null) {
      setState(() {
        selectedDate = '${date.year}-${date.month}-${date.day}';
      });
    } else {
      setState(() {
        selectedDate = null;
      });
    }
  }
}
