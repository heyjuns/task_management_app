import '../task.dart';

abstract class TaskFirebaseDataSource {
  Future<List<TaskEntity>> getTasks(TasksParams params);
  Future<void> createTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
}
