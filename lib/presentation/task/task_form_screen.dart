import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/domain/domain.dart';
import 'package:task_management_app/presentation/routing/args/task_edit_args.dart';
import 'package:uuid/v8.dart';
import 'package:intl/intl.dart';
import '../../application/application.dart';
import '../../ui/ui.dart';

class TaskFormScreen extends HookConsumerWidget {
  final TaskEditArgs? args;

  const TaskFormScreen({super.key, this.args});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final titleController = useTextEditingController(
      text: args?.task?.title ?? '',
    );
    final descriptionController = useTextEditingController(
      text: args?.task?.description ?? '',
    );
    final priority = useState<TaskPriority>(
      args?.task?.priority ?? TaskPriority.medium,
    );
    final dueDate = useState<DateTime?>(
      args?.task?.dueDate ?? DateTime.now().add(const Duration(days: 1)),
    );
    final dueDateController = useTextEditingController(
      text: DateFormat('yyyy-MM-dd').format(dueDate.value!),
    );
    return Scaffold(
      appBar: AppBar(
        title: AppText.titleLarge('Task'),
        actions:
            args?.task != null
                ? [
                  IconButton(
                    icon: const Icon(Icons.delete, color: AppColors.errorColor),
                    onPressed: () async {
                      final confirmed = await showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: AppText.headlineMedium('Confirm Deletion'),
                              content: AppText.bodyMedium(
                                'Are you sure you want to delete this task?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed:
                                      () => Navigator.of(context).pop(false),
                                  child: AppText.labelMedium('Cancel'),
                                ),
                                TextButton(
                                  onPressed:
                                      () => Navigator.of(context).pop(true),
                                  child: AppText.labelMedium('Delete'),
                                ),
                              ],
                            ),
                      );

                      if (confirmed ?? false) {
                        ref
                            .read(taskNotifierProvider.notifier)
                            .deleteTask(args!.task!.id);
                        if (!context.mounted) return;
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ]
                : const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                AppSpacingWidgets.mediumVerticalSpacer,
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                AppSpacingWidgets.mediumVerticalSpacer,
                DropdownButtonFormField(
                  value: priority.value,
                  items:
                      TaskPriority.values.map((priority) {
                        return DropdownMenuItem(
                          value: priority,
                          child: AppText.labelMedium(priority.name),
                        );
                      }).toList(),
                  onChanged: (value) {
                    priority.value = value as TaskPriority;
                  },
                  decoration: InputDecoration(labelText: 'Priority'),
                ),
                AppSpacingWidgets.mediumVerticalSpacer,
                TextField(
                  controller: dueDateController,
                  decoration: InputDecoration(
                    labelText: 'Due Date',
                    icon: const Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: dueDate.value!,
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      dueDate.value = pickedDate;
                      dueDateController.text = DateFormat(
                        'yyyy-MM-dd',
                      ).format(dueDate.value!);
                    }
                  },
                ),
                AppSpacingWidgets.mediumVerticalSpacer,
                AppButtonTypes.primaryButton(
                  args?.task != null ? 'Update Task' : 'Create Task',
                  () {
                    if (formKey.currentState!.validate()) {
                      final newTask = TaskEntity(
                        id: args?.task?.id ?? UuidV8().generate(),
                        title: titleController.text,
                        description: descriptionController.text,
                        dueDate: dueDate.value!,
                        priority: priority.value,
                      );
                      if (args?.task != null) {
                        ref
                            .read(taskNotifierProvider.notifier)
                            .updateTask(newTask);
                      } else {
                        ref
                            .read(taskNotifierProvider.notifier)
                            .addTask(newTask);
                      }
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
