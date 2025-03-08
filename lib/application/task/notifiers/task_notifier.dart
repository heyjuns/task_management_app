import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/task/task.dart';

class TaskNotifier extends StateNotifier<AsyncValue<List<TaskEntity>>> {
  final GetTasksUseCase _getTasks;
  final CreateTaskUseCase _createTask;
  final UpdateTaskUseCase _updateTask;
  final DeleteTaskUseCase _deleteTask;
  TasksParams tasksParams = TasksParams.init();

  TaskNotifier(
    this._getTasks,
    this._createTask,
    this._updateTask,
    this._deleteTask,
  ) : super(const AsyncValue.loading()) {
    loadTasks(tasksParams);
  }

  Future<void> loadTasks(TasksParams params) async {
    state = const AsyncValue.loading();
    final failureOrTasks = await _getTasks.execute(params);
    state = failureOrTasks.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (tasks) => AsyncValue.data(tasks),
    );
  }

  Future<void> addTask(TaskEntity task) async {
    final failureOrUnit = await _createTask.execute(task);
    failureOrUnit.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (_) => loadTasks(tasksParams),
    );
  }

  Future<void> updateTask(TaskEntity task) async {
    final failureOrUnit = await _updateTask.execute(task);
    failureOrUnit.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (_) => loadTasks(tasksParams),
    );
  }

  Future<void> deleteTask(String id) async {
    final failureOrUnit = await _deleteTask.execute(id);
    failureOrUnit.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (_) => loadTasks(tasksParams),
    );
  }
}
