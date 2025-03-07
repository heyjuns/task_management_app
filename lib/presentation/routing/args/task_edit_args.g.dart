// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_edit_args.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskEditArgs _$TaskEditArgsFromJson(Map<String, dynamic> json) =>
    _TaskEditArgs(
      task:
          json['task'] == null
              ? null
              : TaskEntity.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskEditArgsToJson(_TaskEditArgs instance) =>
    <String, dynamic>{'task': instance.task};
