import 'package:dartz/dartz.dart';

import '../task.dart';

abstract class TaskRepository {
  Future<Either<TaskFailure, List<TaskEntity>>> getTasks(TasksParams params);
  Future<Either<TaskFailure, TaskEntity>> getTask(String id);
  Future<Either<TaskFailure, Unit>> createTask(TaskEntity task);
  Future<Either<TaskFailure, Unit>> updateTask(TaskEntity task);
  Future<Either<TaskFailure, Unit>> deleteTask(String id);
}
