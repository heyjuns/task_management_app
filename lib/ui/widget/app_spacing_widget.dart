import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

class AppSpacingWidgets {
  static SizedBox tinyVerticalSpacer = SizedBox(height: AppSpacing.tiny);
  static SizedBox smallVerticalSpacer = SizedBox(height: AppSpacing.small);
  static SizedBox mediumVerticalSpacer = SizedBox(height: AppSpacing.medium);
  static SizedBox largeVerticalSpacer = SizedBox(height: AppSpacing.large);
  static SizedBox extraLargeVerticalSpacer = SizedBox(
    height: AppSpacing.extraLarge,
  );

  static SizedBox tinyHorizontalSpacer = SizedBox(width: AppSpacing.tiny);
  static SizedBox smallHorizontalSpacer = SizedBox(width: AppSpacing.small);
  static SizedBox mediumHorizontalSpacer = SizedBox(width: AppSpacing.medium);
  static SizedBox largeHorizontalSpacer = SizedBox(width: AppSpacing.large);
  static SizedBox extraLargeHorizontalSpacer = SizedBox(
    width: AppSpacing.extraLarge,
  );
}
