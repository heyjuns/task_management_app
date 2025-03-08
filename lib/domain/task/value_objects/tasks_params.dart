import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_management_app/domain/task/task.dart';
import 'package:flutter/foundation.dart';
part 'tasks_params.freezed.dart';
part 'tasks_params.g.dart';

@freezed
abstract class TasksParams with _$TasksParams {
  TasksParams._();
  factory TasksParams({
    String? sortBy,
    @Default(true) bool ascending,
    TaskPriority? priorityFilter,
    bool? isCompleted,
  }) = _TasksParams;

  factory TasksParams.fromJson(Map<String, dynamic> json) =>
      _$TasksParamsFromJson(json);

  factory TasksParams.init() => TasksParams();
}
