import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/usecases/usecase.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/domain/failures/task_failure.dart';
import 'package:task_management_app/domain/repositories/task_repository.dart';

class GetTaskUseCase extends UseCase<String, TaskEntity> {
  final TaskRepository _taskRepository;

  GetTaskUseCase(this._taskRepository);

  @override
  Future<Either<TaskFailure, TaskEntity>> execute(String task) async {
    return _taskRepository.getTask(task);
  }
}
