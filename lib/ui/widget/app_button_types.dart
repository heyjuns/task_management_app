import 'package:flutter/widgets.dart';
import 'package:task_management_app/ui/widget/app_button.dart';

class AppButtonTypes {
  static AppButton primaryButton(String text, VoidCallback onPressed) {
    return AppButton(
      text: text,
      onPressed: onPressed,
      isPrimary: true,
      isSecondary: false, // Explicitly set to false
    );
  }

  static AppButton secondaryButton(String text, VoidCallback onPressed) {
    return AppButton(
      text: text,
      onPressed: onPressed,
      isPrimary: false, // Explicitly set to false
      isSecondary: true,
    );
  }

  static AppButton outlineButton(String text, VoidCallback onPressed) {
    return AppButton(
      text: text,
      onPressed: onPressed,
      isPrimary: false, // Explicitly set to false
      isSecondary: false, // Explicitly set to false
      isOutline: true,
    );
  }
}
