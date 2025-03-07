import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../task.dart';
part 'task_entity.freezed.dart';
part 'task_entity.g.dart';

@freezed
abstract class TaskEntity with _$TaskEntity {
  factory TaskEntity({
    required String id,
    required String title,
    required String description,
    required DateTime dueDate,
    required TaskPriority priority,
    @Default(false) bool isCompleted,
  }) = _TaskEntity;

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);
}
