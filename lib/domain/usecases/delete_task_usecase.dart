import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/usecases/usecase.dart';
import 'package:task_management_app/domain/failures/task_failure.dart';
import 'package:task_management_app/domain/repositories/task_repository.dart';

class DeleteTaskUseCase extends UseCase<String, Unit> {
  final TaskRepository _taskRepository;

  DeleteTaskUseCase(this._taskRepository);

  @override
  Future<Either<TaskFailure, Unit>> execute(String task) async {
    return _taskRepository.deleteTask(task);
  }
}
