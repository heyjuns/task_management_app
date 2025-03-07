part of '../task_list_screen.dart';

class _TasksView extends StatelessWidget {
  final List<TaskEntity> tasks;
  final void Function(TaskEntity value)? onSelected;
  final void Function(TaskEntity value)? onChanged;
  const _TasksView({required this.tasks, this.onSelected, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppPadding.small,
      sliver: SliverList.separated(
        itemCount: tasks.length,
        separatorBuilder:
            (context, index) => AppSpacingWidgets.smallVerticalSpacer,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskView(
            task: task,
            key: ObjectKey(task),
            onTap: () {
              onSelected?.call(task);
            },
            onChanged: (value) {
              final updatedTask = task.copyWith(isCompleted: value ?? false);
              onChanged?.call(updatedTask);
            },
          );
        },
      ),
    );
  }
}
