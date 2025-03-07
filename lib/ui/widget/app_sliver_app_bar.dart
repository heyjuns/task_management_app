import 'package:flutter/material.dart';

class AppSliverAppBar extends StatelessWidget {
  final List<Widget>? actions;
  final List<Widget> title;
  const AppSliverAppBar({super.key, this.actions, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 4,
      pinned: true, // Keeps app bar visible when collapsed
      stretch: true, // Enables stretch effect
      expandedHeight: 150, // The height when fully expanded
      collapsedHeight:
          kToolbarHeight, // Standard toolbar height (56 by default)
      actions: actions,

      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate shrinking factor based on scroll progress
          final double percent =
              (constraints.maxHeight - kToolbarHeight) / (150 - kToolbarHeight);
          final double scale =
              0.8 + (0.2 * percent); // Scale between 0.8 and 1.0
          final double opacity = percent.clamp(0.0, 1.0); // Fade effect

          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: 16, bottom: 16),
            title: Transform.scale(
              scale: scale,
              alignment: Alignment.centerLeft,
              child: Opacity(
                opacity: opacity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: title,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
