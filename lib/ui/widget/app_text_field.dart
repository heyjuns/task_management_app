import 'package:flutter/material.dart';

import '../ui.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final bool isMultiline;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.isMultiline = false,
    this.isReadOnly = false,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: isReadOnly,
      onTap: onTap,
      maxLines: isMultiline ? 3 : 1,
      style: TextStyle(fontSize: 16, color: AppColors.textSecondaryColor),
      onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        filled: true,
        floatingLabelStyle: TextStyle(
          backgroundColor:
              AppColors.accentColor, // Same as your screen's background
          color: AppColors.backgroundColor, // Ensures contrast
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none, // Removes default border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }
}
