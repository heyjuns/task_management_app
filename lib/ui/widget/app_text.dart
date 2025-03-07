import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const AppText.displayLarge(this.text, {super.key})
    : style = const TextStyle(fontSize: 57, fontWeight: FontWeight.bold);
  const AppText.displayMedium(this.text, {super.key})
    : style = const TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  const AppText.displaySmall(this.text, {super.key})
    : style = const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

  const AppText.headlineLarge(this.text, {super.key})
    : style = const TextStyle(fontSize: 32, fontWeight: FontWeight.w600);
  const AppText.headlineMedium(this.text, {super.key})
    : style = const TextStyle(fontSize: 28, fontWeight: FontWeight.w600);
  const AppText.headlineSmall(this.text, {super.key})
    : style = const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);

  const AppText.titleLarge(this.text, {super.key})
    : style = const TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
  const AppText.titleMedium(this.text, {super.key})
    : style = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  const AppText.titleSmall(this.text, {super.key})
    : style = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  const AppText.bodyLarge(this.text, {super.key})
    : style = const TextStyle(fontSize: 16);
  const AppText.bodyMedium(this.text, {super.key})
    : style = const TextStyle(fontSize: 14);
  const AppText.bodySmall(this.text, {super.key})
    : style = const TextStyle(fontSize: 12);

  const AppText.labelLarge(this.text, {super.key})
    : style = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  const AppText.labelMedium(this.text, {super.key})
    : style = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  const AppText.labelSmall(this.text, {super.key})
    : style = const TextStyle(fontSize: 11, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
