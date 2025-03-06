import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/usecases/usecase.dart';
import 'package:task_management_app/domain/task/entities/task_entity.dart';
import 'package:task_management_app/domain/task/failures/task_failure.dart';
import 'package:task_management_app/domain/task/repositories/task_repository.dart';

class UpdateTaskUseCase extends UseCase<TaskEntity, Unit> {
  final TaskRepository _taskRepository;

  UpdateTaskUseCase(this._taskRepository);

  @override
  Future<Either<TaskFailure, Unit>> execute(TaskEntity task) async {
    return _taskRepository.updateTask(task);
  }
}
