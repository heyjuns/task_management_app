abstract class TaskFailure {
  const TaskFailure();
}

class Unexpected extends TaskFailure {
  const Unexpected();
}

class InsufficientPermission extends TaskFailure {
  const InsufficientPermission();
}

class UnableToUpdate extends TaskFailure {
  const UnableToUpdate();
}
