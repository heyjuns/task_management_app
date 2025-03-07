import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  AppText.displayLarge(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 57, fontWeight: FontWeight.bold).merge(style);
  AppText.displayMedium(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 45, fontWeight: FontWeight.bold).merge(style);
  AppText.displaySmall(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 36, fontWeight: FontWeight.bold).merge(style);

  AppText.headlineLarge(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 32, fontWeight: FontWeight.w600).merge(style);
  AppText.headlineMedium(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 28, fontWeight: FontWeight.w600).merge(style);
  AppText.headlineSmall(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 24, fontWeight: FontWeight.w600).merge(style);

  AppText.titleLarge(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 22, fontWeight: FontWeight.w500).merge(style);
  AppText.titleMedium(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 16, fontWeight: FontWeight.w500).merge(style);
  AppText.titleSmall(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 14, fontWeight: FontWeight.w500).merge(style);

  AppText.bodyLarge(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 16).merge(style);
  AppText.bodyMedium(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 14).merge(style);
  AppText.bodySmall(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 12).merge(style);

  AppText.labelLarge(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 14, fontWeight: FontWeight.w600).merge(style);
  AppText.labelMedium(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 12, fontWeight: FontWeight.w600).merge(style);
  AppText.labelSmall(this.text, {super.key, TextStyle? style})
    : style = TextStyle(fontSize: 11, fontWeight: FontWeight.w600).merge(style);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
