import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/failures/failure.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> execute(Input input);
}
