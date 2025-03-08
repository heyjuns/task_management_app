import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/task/task.dart';
part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
abstract class TaskDto with _$TaskDto {
  factory TaskDto({
    required String id,
    required String title,
    required String description,
    required DateTime dueDate,
    required TaskPriority priority,
    required bool isCompleted,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  TaskDto._();

  factory TaskDto.fromDomain(TaskEntity task) {
    return TaskDto(
      id: task.id,
      title: task.title,
      description: task.description,
      dueDate: task.dueDate,
      priority: task.priority,
      isCompleted: task.isCompleted,
    );
  }

  TaskEntity toDomain() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      dueDate: dueDate,
      priority: priority,
      isCompleted: isCompleted,
    );
  }

  factory TaskDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TaskDto.fromJson({
      'id': doc.id,
      'title': data['title'] as String,
      'description': data['description'] as String,
      'dueDate': data['dueDate'] as String,
      'priority': data['priority'] as String,
      'isCompleted': data['isCompleted'] as bool,
    });
  }
}
