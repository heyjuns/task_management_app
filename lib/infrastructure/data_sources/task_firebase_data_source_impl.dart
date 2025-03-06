import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/domain/data_sources/task_firebase_data_source.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/infrastructure/dtos/task_dto.dart';

class TaskFirebaseDataSourceImpl implements TaskFirebaseDataSource {
  final CollectionReference tasksCollection = FirebaseFirestore.instance
      .collection('tasks');

  @override
  Future<List<TaskEntity>> getTasks() async {
    final snapshot = await tasksCollection.get();
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
