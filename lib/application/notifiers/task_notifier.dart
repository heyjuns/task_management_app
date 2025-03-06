import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';

import '../../domain/usecases/usecases.dart';

class TaskNotifier extends StateNotifier<AsyncValue<List<TaskEntity>>> {
  final GetTasksUseCase _getTasks;
  final CreateTaskUseCase _createTask;
  final UpdateTaskUseCase _updateTask;
  final DeleteTaskUseCase _deleteTask;

  TaskNotifier(
    this._getTasks,
    this._createTask,
    this._updateTask,
    this._deleteTask,
  ) : super(const AsyncValue.loading()) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    state = const AsyncValue.loading();
    final failureOrTasks = await _getTasks.execute(unit);
    state = failureOrTasks.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (tasks) => AsyncValue.data(tasks),
    );
  }

  Future<void> addTask(TaskEntity task) async {
    final failureOrUnit = await _createTask.execute(task);
    failureOrUnit.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (_) => loadTasks(),
    );
  }

  Future<void> updateTask(TaskEntity task) async {
    final failureOrUnit = await _updateTask.execute(task);
    failureOrUnit.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (_) => loadTasks(),
    );
  }

  Future<void> deleteTask(String id) async {
    final failureOrUnit = await _deleteTask.execute(id);
    failureOrUnit.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (_) => loadTasks(),
    );
  }
}
