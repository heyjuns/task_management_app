import 'package:dartz/dartz.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/domain/failures/task_failure.dart';

abstract class TaskRepository {
  Future<Either<TaskFailure, List<TaskEntity>>> getTasks();
  Future<Either<TaskFailure, TaskEntity>> getTask(String id);
  Future<Either<TaskFailure, Unit>> createTask(TaskEntity task);
  Future<Either<TaskFailure, Unit>> updateTask(TaskEntity task);
  Future<Either<TaskFailure, Unit>> deleteTask(String id);
}
