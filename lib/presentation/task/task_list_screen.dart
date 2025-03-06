import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/domain/domain.dart';
import 'package:task_management_app/presentation/routing/args/task_edit_args.dart';
import 'package:task_management_app/presentation/routing/routes/routes.dart';
import 'package:task_management_app/presentation/routing/routes/task_routes.dart';
import 'package:uuid/v8.dart';

import '../../application/application.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<TaskEntity>> tasks = ref.watch(taskNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: tasks.when(
        data:
            (taskList) => ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return ListTile(
                  onTap: () {
                    context.pushNamed(
                      Routes.taskEdit.name,
                      extra: TaskEditArgs(task: task),
                    );
                  },
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref
                          .read(taskNotifierProvider.notifier)
                          .deleteTask(task.id);
                    },
                  ),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Example of adding a new task

          context.pushNamed(Routes.taskEdit.name);
          // final newTask = TaskEntity(
          //   id: UuidV8().generate(), // Generate a unique ID
          //   title: 'New Task ${Math.Random().nextInt(100)}',
          //   description: 'Description of new task',
          //   dueDate: DateTime.now().add(const Duration(days: 1)),
          //   priority: TaskPriority.medium,
          // );
          // await ref.read(taskNotifierProvider.notifier).addTask(newTask);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
