import 'package:flutter/material.dart';
import 'package:task_management_app/ui/theme/app_spacing.dart';

class AppPadding {
  static const EdgeInsets tiny = EdgeInsets.all(AppSpacing.tiny);
  static const EdgeInsets small = EdgeInsets.all(AppSpacing.small);
  static const EdgeInsets medium = EdgeInsets.all(AppSpacing.medium);
  static const EdgeInsets large = EdgeInsets.all(AppSpacing.large);
  static const EdgeInsets extraLarge = EdgeInsets.all(AppSpacing.extraLarge);

  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(
    horizontal: AppSpacing.small,
  );
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(
    horizontal: AppSpacing.medium,
  );
  static const EdgeInsets horizontalLarge = EdgeInsets.symmetric(
    horizontal: AppSpacing.large,
  );

  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(
    vertical: AppSpacing.small,
  );
  static const EdgeInsets verticalMedium = EdgeInsets.symmetric(
    vertical: AppSpacing.medium,
  );
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(
    vertical: AppSpacing.large,
  );
}
