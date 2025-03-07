import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/task/task.dart';
import '../task.dart';

class TaskFirebaseDataSourceImpl implements TaskFirebaseDataSource {
  final CollectionReference tasksCollection = FirebaseFirestore.instance
      .collection('tasks');

  @override
  Future<List<TaskEntity>> getTasks(TasksParams params) async {
    Query query = tasksCollection;

    if (params.priorityFilter != null) {
      query = query.where('priority', isEqualTo: params.priorityFilter!.name);
    }
    if (params.isCompleted != null) {
      query = query.where('isCompleted', isEqualTo: params.isCompleted);
    }

    if (params.sortBy != null) {
      query = query.orderBy(params.sortBy!, descending: !params.ascending);
    }

    final snapshot = await query.get();
    return snapshot.docs
        .map((doc) => TaskDto.fromFirestore(doc).toDomain())
        .toList();
  }

  @override
  Future<void> createTask(TaskEntity task) async {
    final taskDto = TaskDto.fromDomain(task);
    await tasksCollection.doc(task.id).set(taskDto.toJson());
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final taskDto = TaskDto.fromDomain(task);
    await tasksCollection.doc(task.id).update(taskDto.toJson());
  }

  @override
  Future<void> deleteTask(String id) async {
    await tasksCollection.doc(id).delete();
  }
}
