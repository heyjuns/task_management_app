import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class GetTasksUseCase extends UseCase<TasksParams, List<TaskEntity>> {
  final TaskRepository _taskRepository;

  GetTasksUseCase(this._taskRepository);

  @override
  Future<Either<TaskFailure, List<TaskEntity>>> execute(
    TasksParams params,
  ) async {
    return _taskRepository.getTasks(params);
  }
}
