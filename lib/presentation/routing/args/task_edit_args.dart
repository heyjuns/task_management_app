import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/task/task.dart';
import 'package:flutter/foundation.dart';
part 'task_edit_args.freezed.dart';
part 'task_edit_args.g.dart';

@freezed
abstract class TaskEditArgs with _$TaskEditArgs {
  factory TaskEditArgs({TaskEntity? task}) = _TaskEditArgs;

  factory TaskEditArgs.fromJson(Map<String, dynamic> json) =>
      _$TaskEditArgsFromJson(json);
}
