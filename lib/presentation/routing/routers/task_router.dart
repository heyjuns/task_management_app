import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/presentation/routing/args/task_edit_args.dart';
import 'package:task_management_app/presentation/routing/routes/routes.dart';
import 'package:task_management_app/presentation/task/task_form_screen.dart';
import 'package:task_management_app/presentation/task/task_list_screen.dart';

abstract class TaskRouter {
  static GoRoute get main {
    return GoRoute(
      path: Routes.tasks.path,
      name: Routes.tasks.name,
      pageBuilder:
          (context, state) => NoTransitionPage(child: TaskListScreen()),
      routes: [
        GoRoute(
          path: Routes.taskEdit.path,
          name: Routes.taskEdit.name,
          pageBuilder: (context, state) {
            final TaskEditArgs? args = state.extra as TaskEditArgs?;
            return MaterialPage(child: TaskFormScreen(args: args));
          },
        ),
      ],
    );
  }
}
