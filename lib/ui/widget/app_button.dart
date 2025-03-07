import 'package:flutter/material.dart';
import 'package:task_management_app/ui/theme/app_colors.dart';

import '../theme/app_border_radius.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isSecondary;
  final bool isOutline;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = false,
    this.isSecondary = false,
    this.isOutline = false,
    this.isLoading = false,
  }) : assert(
         !(isPrimary && isSecondary),
         'Cannot be both primary and secondary',
       );

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        isPrimary
            ? AppColors.primaryColor
            : isSecondary
            ? AppColors.secondaryColor
            : Colors.grey;
    Color textColor =
        isPrimary || isSecondary ? Colors.white : AppColors.textColor;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutline ? Colors.transparent : backgroundColor,
        foregroundColor: isOutline ? backgroundColor : textColor,
        elevation: isOutline ? 0 : 4,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.small,
          side:
              isOutline
                  ? BorderSide(color: backgroundColor, width: 1)
                  : BorderSide.none,
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child:
          isLoading
              ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color:
                      isPrimary || isSecondary
                          ? Colors.white
                          : AppColors.primaryColor,
                ),
              )
              : Text(text, style: TextStyle(fontSize: 16)),
    );
  }
}
