import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_management_app/domain/domain.dart';
import 'package:task_management_app/presentation/routing/args/task_edit_args.dart';
import 'package:task_management_app/presentation/routing/routes/routes.dart';
import 'package:intl/intl.dart';
import 'package:uuid/v8.dart';
import '../../application/application.dart';
import '../../ui/ui.dart';
import 'widget/task_filter_modal.dart';

part 'widget/task_view.dart';
part 'widget/tasks_view.dart';
part 'widget/error_view.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});
  // Function to format date with ordinal suffix
  String _formattedDate() {
    final now = DateTime.now();
    final day = now.day;
    final suffix = _getDaySuffix(day);
    return DateFormat('EEEE, MMMM d').format(now) + suffix;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<TaskEntity>> tasks = ref.watch(taskNotifierProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppSliverAppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder:
                        (context) => TaskFilterModal(
                          onApply: (params) {
                            ref
                                .read(taskNotifierProvider.notifier)
                                .loadTasks(params);
                          },
                        ),
                  );
                },
              ),
            ],
            title: [
              AppText.titleLarge(
                'My Task',
                style: TextStyle(color: Colors.white),
              ),
              AppText.titleSmall(
                _formattedDate(),
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          tasks.when(
            data:
                (taskList) => _TasksView(
                  tasks: taskList,
                  onSelected:
                      (value) => context.pushNamed(
                        Routes.taskEdit.name,
                        extra: TaskEditArgs(task: value),
                      ),
                  onChanged: (value) {
                    ref.read(taskNotifierProvider.notifier).updateTask(value);
                  },
                ),

            loading:
                () => Skeletonizer.sliver(
                  enabled: true,
                  child: _TasksView(
                    tasks: List.generate(5, (index) => TaskEntity.init()),
                  ),
                ),
            error:
                (error, stackTrace) =>
                    SliverToBoxAdapter(child: _ErrorView(error: error)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed(Routes.taskEdit.name);

          // final TaskEntity task = TaskEntity(
          //   id: UuidV8().generate(),
          //   title: 'title ${Random().nextInt(100)}',
          //   description: 'description ${Random().nextInt(100)}',
          //   dueDate: DateTime.now().add(Duration(hours: Random().nextInt(60))),
          //   priority: TaskPriority.high,
          // );
          // ref.read(taskNotifierProvider.notifier).addTask(task);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
