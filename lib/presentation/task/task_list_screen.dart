import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/domain/domain.dart';
import 'package:task_management_app/presentation/routing/args/task_edit_args.dart';
import 'package:task_management_app/presentation/routing/routes/routes.dart';

import '../../application/application.dart';
import '../../ui/ui.dart';

part 'widget/task_view.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<TaskEntity>> tasks = ref.watch(taskNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: AppText.titleLarge('Task List')),
      body: tasks.when(
        data:
            (taskList) => ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return Card(
                  margin: AppPadding.small,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppBorderRadius.small,
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 4,
                      decoration: BoxDecoration(
                        color:
                            task.priority == TaskPriority.low
                                ? AppColors.textSecondaryColor
                                : task.priority == TaskPriority.medium
                                ? AppColors.warningColor
                                : AppColors.errorColor,
                        borderRadius: AppBorderRadius.large,
                      ),
                    ),
                    onTap: () {
                      context.pushNamed(
                        Routes.taskEdit.name,
                        extra: TaskEditArgs(task: task),
                      );
                    },
                    title: AppText.bodyMedium(
                      task.title,
                      style:
                          task.isCompleted
                              ? TextStyle(
                                decoration: TextDecoration.lineThrough,
                              )
                              : null,
                    ),
                    subtitle: AppText.bodySmall(
                      task.description,
                      style:
                          task.isCompleted
                              ? TextStyle(
                                decoration: TextDecoration.lineThrough,
                              )
                              : null,
                    ),
                    trailing: IconButton(
                      icon:
                          task.isCompleted
                              ? const Icon(
                                Icons.check_circle,
                                color: AppColors.primaryColor,
                              )
                              : const Icon(Icons.check_circle_outline),
                      onPressed: () {
                        final updatedTask = task.copyWith(
                          isCompleted: !task.isCompleted,
                        );
                        ref
                            .read(taskNotifierProvider.notifier)
                            .updateTask(updatedTask);
                      },
                    ),
                  ),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) =>
                Center(child: AppText.bodyMedium('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed(Routes.taskEdit.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
