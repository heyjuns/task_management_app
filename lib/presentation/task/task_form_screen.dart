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
      body: CustomScrollView(
        slivers: [
          AppSliverAppBar(
            title: [
              AppText.titleLarge(
                '${args?.task != null ? 'Edit' : 'Create'} Task',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),

          // Form Content
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      controller: titleController,
                      label: 'Title',
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter a title'
                                  : null,
                    ),
                    AppSpacingWidgets.mediumVerticalSpacer,
                    AppTextField(
                      controller: descriptionController,
                      label: 'Description',
                      isMultiline: true,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter a description'
                                  : null,
                    ),
                    AppSpacingWidgets.mediumVerticalSpacer,
                    DropdownButtonFormField<TaskPriority>(
                      value: priority.value,
                      items:
                          TaskPriority.values
                              .map(
                                (priority) => DropdownMenuItem(
                                  value: priority,
                                  child: AppText.bodySmall(priority.name),
                                ),
                              )
                              .toList(),
                      onChanged: (value) => priority.value = value!,
                      decoration: InputDecoration(
                        labelText: 'Priority',
                        floatingLabelStyle: TextStyle(
                          backgroundColor:
                              AppColors
                                  .accentColor, // Same as your screen's background
                          color: AppColors.backgroundColor, // Ensures contrast
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    AppSpacingWidgets.mediumVerticalSpacer,
                    AppTextField(
                      controller: dueDateController,
                      label: 'Due Date',
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
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: AppButtonTypes.primaryButton(
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
                        ),
                        if (args?.task != null)
                          Expanded(
                            child: AppButtonTypes.secondaryButton(
                              'Remove',
                              () async {
                                final confirmed = await showDialog(
                                  context: context,
                                  builder:
                                      (context) => AlertDialog(
                                        title: AppText.headlineMedium(
                                          'Confirm Deletion',
                                        ),
                                        content: AppText.bodyMedium(
                                          'Are you sure you want to delete this task?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed:
                                                () => Navigator.of(
                                                  context,
                                                ).pop(false),
                                            child: AppText.labelMedium(
                                              'Cancel',
                                            ),
                                          ),
                                          TextButton(
                                            onPressed:
                                                () => Navigator.of(
                                                  context,
                                                ).pop(true),
                                            child: AppText.labelMedium(
                                              'Delete',
                                            ),
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
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
