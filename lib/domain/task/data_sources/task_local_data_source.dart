import '../task.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskEntity>> getTasks();
  Future<void> insertTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
}
