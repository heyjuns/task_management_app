import 'package:task_management_app/core/failures/failure.dart';

abstract class TaskFailure extends Failure {
  const TaskFailure();
}

class TaskUnexpected extends TaskFailure {
  const TaskUnexpected();
}

class TaskInsufficientPermission extends TaskFailure {
  const TaskInsufficientPermission();
}

class TaskUnableToUpdate extends TaskFailure {
  const TaskUnableToUpdate();
}
