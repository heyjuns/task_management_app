part of '../task_list_screen.dart';

class TaskView extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback? onTap;
  final void Function(bool? value)? onChanged;
  const TaskView({super.key, required this.task, this.onTap, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppPadding.small,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.small,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .2), // Shadow color
              blurRadius: 2, // Soften the shadow
              spreadRadius: 1, // Extend the shadow
              offset: Offset(1, 1), // Move shadow right & down
            ),
          ],
          border: Border(
            left: BorderSide(
              width: 4,
              color:
                  task.priority == TaskPriority.low
                      ? AppColors.textSecondaryColor
                      : task.priority == TaskPriority.medium
                      ? AppColors.warningColor
                      : AppColors.errorColor,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.titleMedium(
                    task.title,
                    style:
                        task.isCompleted
                            ? TextStyle(decoration: TextDecoration.lineThrough)
                            : null,
                  ),
                  AppText.bodySmall(
                    task.description,
                    style:
                        task.isCompleted
                            ? TextStyle(decoration: TextDecoration.lineThrough)
                            : null,
                  ),
                ],
              ),
            ),
            Checkbox(value: task.isCompleted, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
