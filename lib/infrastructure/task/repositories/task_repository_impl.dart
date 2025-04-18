import 'package:dartz/dartz.dart';

import '../../../domain/task/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskFirebaseDataSource _firebaseDataSource;
  final TaskLocalDataSource _localDataSource;

  TaskRepositoryImpl(this._firebaseDataSource, this._localDataSource);

  @override
  Future<Either<TaskFailure, List<TaskEntity>>> getTasks(
    TasksParams params,
  ) async {
    try {
      final tasks = await _firebaseDataSource.getTasks(params);
      if (tasks.isNotEmpty) {
        for (var task in tasks) {
          await _localDataSource.insertTask(task);
        }
      }

      return Right(tasks);
    } catch (e) {
      try {
        final localTasks = await _localDataSource.getTasks();
        return Right(localTasks);
      } catch (_) {
        return const Left(TaskUnexpected());
      }
    }
  }

  @override
  Future<Either<TaskFailure, TaskEntity>> getTask(String id) async {
    try {
      final task = await _localDataSource.getTasks().then(
        (tasks) => tasks.firstWhere((t) => t.id == id),
      );
      return Right(task);
    } catch (e) {
      return const Left(TaskUnexpected());
    }
  }

  @override
  Future<Either<TaskFailure, Unit>> createTask(TaskEntity task) async {
    try {
      await _firebaseDataSource.createTask(task);
      await _localDataSource.insertTask(task);
      return const Right(unit);
    } catch (e) {
      return const Left(TaskUnexpected());
    }
  }

  @override
  Future<Either<TaskFailure, Unit>> updateTask(TaskEntity task) async {
    try {
      await _firebaseDataSource.updateTask(task);
      await _localDataSource.updateTask(task);
      return const Right(unit);
    } catch (e) {
      return const Left(TaskUnexpected());
    }
  }

  @override
  Future<Either<TaskFailure, Unit>> deleteTask(String id) async {
    try {
      await _firebaseDataSource.deleteTask(id);
      await _localDataSource.deleteTask(id);
      return const Right(unit);
    } catch (e) {
      return const Left(TaskUnexpected());
    }
  }
}
