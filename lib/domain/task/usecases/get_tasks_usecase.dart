import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/usecases/usecase.dart';
import 'package:task_management_app/domain/task/entities/task_entity.dart';
import 'package:task_management_app/domain/task/failures/task_failure.dart';
import 'package:task_management_app/domain/task/repositories/task_repository.dart';

class GetTasksUseCase extends UseCase<Unit, List<TaskEntity>> {
  final TaskRepository _taskRepository;

  GetTasksUseCase(this._taskRepository);

  @override
  Future<Either<TaskFailure, List<TaskEntity>>> execute(Unit unit) async {
    return _taskRepository.getTasks();
  }
}
