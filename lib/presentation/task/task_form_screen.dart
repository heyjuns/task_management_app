import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/domain/domain.dart';
import 'package:uuid/v8.dart';

import '../../application/application.dart';

class TaskFormScreen extends ConsumerWidget {
  final TaskEntity? task;

  const TaskFormScreen({super.key, this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController(text: task?.title ?? '');
    final _descriptionController = TextEditingController(
      text: task?.description ?? '',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Task Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newTask = TaskEntity(
                      id: task?.id ?? UuidV8().generate(),
                      title: _titleController.text,
                      description: _descriptionController.text,
                      dueDate: DateTime.now().add(const Duration(days: 1)),
                      priority: TaskPriority.medium,
                    );
                    if (task != null) {
                      ref
                          .read(taskNotifierProvider.notifier)
                          .updateTask(newTask);
                    } else {
                      ref.read(taskNotifierProvider.notifier).addTask(newTask);
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text(task != null ? 'Update Task' : 'Create Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
