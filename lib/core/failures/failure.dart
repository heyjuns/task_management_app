abstract class Failure {
  const Failure();
}

class Unexpected extends Failure {
  const Unexpected();
}

class InsufficientPermission extends Failure {
  const InsufficientPermission();
}

class UnableToUpdate extends Failure {
  const UnableToUpdate();
}

class NetworkError extends Failure {
  const NetworkError();
}
